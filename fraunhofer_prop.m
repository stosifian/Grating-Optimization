function [Uout x2 y2] = fraunhofer_prop(Uin,wv1,d1,Dz)
    %Uin: input aperture/wave (assuming incident plane wave)
    %d1: source-plane grid spacing
    %Dz: propagation distance [m]
    %wv1: optical wavelength [m]

    N = size(Uin,1);      %assume square grid
    k = 2*pi/wv1;         %optical wavevector
    fX = (-N/2 : N/2-1) / (N*d1);
    [x2 y2] = meshgrid(wv1*Dz*fX);  %observation-plane coordinates, xy2 = wv1*Dz*fxy1 
    clear('fX');
    Uout = exp(i*k/(2*Dz)*(x2.^2 + y2.^2))/(i*wv1*Dz).*ft2(Uin,d1);
    