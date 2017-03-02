function [sigma]=noise_M1(I,N,Nb)

%NOISE_M1 Noise estimation in 2D MR images using Brummer-Aja's method (X)
%
% The function maches the PDF of the local mean of the Rayleigh background
% with the real data
%
%  Inputs: 
%       I: (double) image with Rayleigh background
%       N: Size of window to estimate local mean (size=NxN)
%       Nb: Number of beens in the histogram
%
% Author: Santiago Aja Fernandez
% NOISE ESTIMATION IN MRI TOOLBOX 
%
% Modified: Oct 02 2008
%

%Local mean-------------------
M1=filter2(ones(N)./(N.^2),I);

Max=moda(M1(:),Nb);
sigma0=sqrt(2/pi).*Max;
fc=2.*Max;


[h,x]=hist(M1(M1<fc),Nb);
h=h./sum(h)./(x(2)-x(1));
N2=N.^2;

KN=(1/N2).*(gamma(2.*N2+1)./gamma(N2+1)./(2^N2)).^(1/N2);
e=exp(1);

fu_x=@(y)sum((h-y(1).*(x.^(2.*N2-1)).*(N2.^N2).*exp(-((x./y(2)).^2)./2./KN.*N2)./(2.^(N2-1))./(y(2).^(2.*N2))./gamma(N2)./(KN.^N2)).^2);

X=fminsearch(fu_x,[1,sigma0]);

sigma=X(2).*sqrt(2/pi).*2./sqrt(exp(1));

