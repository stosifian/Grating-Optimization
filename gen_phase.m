function phase = gen_phase(N,level)
    
    phi = [0:2*pi/level:2*pi*(level-1)/level];
    
    phase = datasample(phi,N^2);
    phase = reshape(phase,[N N]);
    
end

    
    