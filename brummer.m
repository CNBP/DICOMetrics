function sigma=brummer(I,Nb)

%BRUMMER Noise estimation in 2D MR images using Brummer's method
%
%  Inputs: 
%       I: (double) image with Rayleigh background
%       Nb: Number of beens in the histogram
%
% Author: Santiago Aja Fernandez
% NOISE ESTIMATION IN MRI TOOLBOX 
%
% Modified: Oct 02 2008
%
% Uses algorithm developed by Brummer (1993).
% IEEE Tr. Med. Imaging Vol. 12 no. 2 pag 153, June 1993

%Initial Value: Maximum of histogram

sigma0=moda(I(:),Nb);
fc=2.*sigma0;


[h,x]=hist(I(I<fc),Nb);
h=h./sum(h)./(x(2)-x(1));

fu_x=@(y)sum((-h+y(1).*x./(y(2).^2).*exp(-(x./y(2)./sqrt(2)).^2)).^2);
X=fminsearch(fu_x,[1,sigma0]);

sigma=X(2);


