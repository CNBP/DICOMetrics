function localMean=localmean(I,Ws)
% LOCALMEAN local mean of 2D image
%
% localMean=LOCALMEAN(I,Ws) estimates the local mean in a
%    neighborhood around each pixel.
%
%    INPUT:
%
%	- I: input image
%       - Ws: Estimation window Ws=[Wx Wy]
%
%   Author: Santiago Aja Fernandez
%   LOCAL STATISTICS TOOLBOX 
%
%   Modified: Feb 01 2008
%

I=double(I);


localMean = filter2(ones(Ws), I) / prod(Ws);
    

