function localMean=localmean_mask(I,mask,Ws)
% LOCALMEAN_MASK local mean of 2D image (with mask)
%
% localMean=LOCALMEAN(I,Ws) estimates the local mean in a
%    neighborhood around each pixel. Only pixels inside the
%    mask are considered.
%
%    INPUT:
%
%	- I: input image
%       - Ws: Estimation window Ws=[Wx Wy]
%	- mask:  
%	   number: threshold. (Estimation only in pixels
%		   greater or equal the threshold).
%	   2D mask: estimation done in pixles in which mask
%                  is 1.
%    EXAMPLE
%
%          LM=localmean_mask(I,25,[7,7]);
%
%   Author: Santiago Aja Fernandez
%   LOCAL STATISTICS TOOLBOX 
%
%   Modified: Feb 01 2008
%

I=double(I);
[Mx My]=size(I);
if length(mask)==1
Mk=(I>mask);
else
Mk=mask;
end

localMean = filter2(ones(Ws), I) / prod(Ws);
    

      Norm=filter2(ones(Ws), Mk);
      Norm=Norm+((Norm)==0);
      localMean = filter2(ones(Ws), I.*Mk) ./ Norm;     



