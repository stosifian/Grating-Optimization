%Initialize 
N = 64;      % number of grid points
levels = 4;  % number of discrete phase levels (0, pi/2, ...)
L = 72.5e-6; % grating period, total size of the grid [m]
delta = L / N; % source-plane grid spacing [m]
wvl = .632e-6; % optical wavelength [m]
k = 2*pi/wvl;    % optical wavevector [m]
Dz = 1; % propagation distance [m]
n = 5000; % number of iterations
[x1 y1] = meshgrid((-N/2 : N/2-1) * delta);

%Create target diffraction pattern 
target_I = imresize(get_target_from_img('target.png'), [N N]);
%target_I = generate_target(N);
target_A = target_I;

%Display target pattern
figure
imagesc(target_I); colormap gray;
title('Target Pattern')

%Initial Temperature, MSE, and phase
t = 1.0;
mse = zeros(n,1);
phase = gen_phase(N,levels);

%Initial ouput pattern with random initial phase
Uout = ft2(exp(i*phase),delta);
%[Uout x2 y2] = fraunhofer_prop(exp(i*phase), wvl, delta, Dz);

mse(1) = sum(sum((abs(Uout) - target_A).^2))/N^2;
t_k = t;

for k=2:n
    
    disp(k)

    while mse(k) == 0
        %New estimate
        phase_k = phase + .05*gen_phase(N,levels);
        Uout_k = ft2(exp(i*phase_k),delta);
        %[Uout_k x2 y2] = fraunhofer_prop(exp(i*phase), wvl, delta, Dz);
        
        %MSE of new estimate
        mse_k = sum(sum((abs(Uout_k) - target_A).^2))/N^2;

        %If new estimate better than previous, accept it
        if mse_k <= mse(k-1)
            phase = phase_k;
            mse(k) = mse_k;
        end
        
        %If not, then generate a random number and if less than temperature
        %generate a new estimate
        if mse_k > mse(k-1)
            p = unifrnd(0,1);
            if p < t_k
                phase = phase_k;
                mse(k) = mse_k;
            end
        end
    end
    t_k = t/k^.9;
    
end

plot(mse);

%Quantize final phase mask
phase_n = PhaseTruncate(phase,levels);
Uout_f = ft2(exp(i*phase_n),delta);
%Uout_f = fraunhofer_prop(exp(i*phase_n), wvl, delta, Dz);

%Display optimized phase mask and corresponding pattern
figure
imagesc(phase_n); colormap gray;
title(['Optimized Phase Mask' ': Iteration ' num2str(n)])
figure
imagesc(Uout_f.*conj(Uout_f)); colormap gray;
title(['Optimized Pattern' ': Iteration ' num2str(n)])

