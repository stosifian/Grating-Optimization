function phi_n = PhaseTruncate(phi,levels)
%Maps continuous phase values of -pi to pi to quantized values of
%0 to 2*pi (where levels is the number of quantized values between 0 to
%2*pi)

    phi(phi < 0) = phi(phi < 0) + 2*pi;
    
    phi(phi > 2*pi) = rem(phi(phi > 2*pi),2*pi);
    
    round_phi = [0:2*pi/levels:2*pi];

    phi_n = interp1(round_phi,round_phi,phi,'nearest');
    
    phi_n(phi_n == 2*pi) = 0;

end


    