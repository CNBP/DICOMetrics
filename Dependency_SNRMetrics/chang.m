function sigma=chang(I,n)

%CHANG Noise estimation in 2D MR images using Chang's method
%
%  Inputs: 
%       I: (double) image with Rayleigh background
%       n: Sample size for Gaussian Blurring
%
% Author: Santiago Aja Fernandez
% NOISE ESTIMATION IN MRI TOOLBOX 
%
% Modified: Oct 02 2008
%
% Uses algorithm developed by Brummer (2005).
% Medical Imaging, Porc SPIE Vol 5747, pp. 1605


sigma0=moda(I(:),1000);
fc=2.*sigma0;

s=2.5;

h=1.06*s*(n.^(-1/5));

fu_x=@(y)(-1)./(n.*h.*sqrt(2.*pi)).*sum(exp(-((((y-I(:))./h).^2))./2));
sigma=fminsearch(fu_x,[fc]); 
