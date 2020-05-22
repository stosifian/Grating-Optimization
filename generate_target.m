function target = generate_target(No)

    N = No/2;
    target_I = zeros(N);
    target_I(N/4,N/4:3*N/4) = 1;
    target_I(N/4+1,N/4:3*N/4) = 1;
    target_I(3*N/4,N/4:3*N/4) = 1;
    target_I(3*N/4+1,N/4:3*N/4+1) = 1;
    target_I(N/4:3*N/4,N/4) = 1;
    target_I(N/4:3*N/4,N/4+1) = 1;
    target_I(N/4:3*N/4,3*N/4) = 1;
    target_I(N/4:3*N/4,3*N/4+1) = 1;
    target_I(N/2,N/4:3*N/4) = 1;
    target_I(N/2+1,N/4:3*N/4) = 1;
    target_I(N/4:3*N/4,N/2) = 1;
    target_I(N/4:3*N/4,N/2+1) = 1;
    N = 64;
    target = padarray(target_I,[N/4,N/4],0);
    
end
