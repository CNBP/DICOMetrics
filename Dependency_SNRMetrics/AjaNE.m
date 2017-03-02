function [sigma]=AjaNE(I,N,Nb,method)

%Aja Noise estimation in 2D MR images using Aja's method 
%
% The mode of some histogram is calculated
%
%  Inputs: 
%       I: (double) image with Rayleigh background
%       N: Size of window to estimate local square mean (size=NxN)
%       Nb: Number of beens in the histogram
%       method:
%           1: histogram
%           2: mean (B)
%           3: Second order moment (A) 
%           4: Square root of second order moment
%
% Methods from:
%
% Aja-Fernandez, S. Noise and Signal Estimation in Magnitude MRI and 
% Rician Distributed Images: A LMMSE Approach 
% Image Processing, IEEE Transactions on, Volume: 17 , Issue: 8  2008
%
% Author: Santiago Aja Fernandez
% NOISE ESTIMATION IN MRI TOOLBOX 
%
% Modified: Oct 02 2008

I=double(I);


if method ==1
     sigma=moda(I(:),Nb);
     sigma=moda(I(I<2.*sigma),Nb);
elseif method==2
    M1=filter2(ones(N)./(N.^2),I);
    Max=moda(M1(:),Nb);
    sigma=sqrt(2/pi).*moda(M1(M1<2.*Max),Nb);
elseif method==3
    M2=filter2(ones(N)./(N.^2-1),I.^2);    
    Max=moda(M2(:),Nb);
    sigma=sqrt(0.5.*moda(M2(M2<2.*Max),Nb));
elseif method==4
    N2=N.^2;
    M2=sqrt(filter2(ones(N)./(N.^2),I.^2));    
    Max=moda(M2(:),Nb);
    sigma=sqrt(N2./(2.*N2-1))*moda(M2(M2<2.*Max),Nb); 
else
    error('Wrong method selection');
end


