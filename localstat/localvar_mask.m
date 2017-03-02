function Vl=varlocal_mask(I,mask,Ws,inses)
% VARLOCAL_MASK local variance of 2D image (with mask)
%
% V=VARLOCAL_MASK(I, mask,Ws, inses) estimates the local variance in a
%    neighborhood around each pixel.
%
%    INPUT:
%
%	- I: input image
%       - Ws: Estimation window Ws=[Wx Wy];
%	- inses: if inses=1 unbiased estimation of Variance
%	- mask:  
%	   number: threshold. (Estimation only in pixels
%		   greater or equal the threshold).
%	   2D mask: estimation done in pixles in which mask
%                  is 1.
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

Norm=filter2(ones(Ws), Mk);
      Norm=Norm+((Norm)==0);
      localMean = filter2(ones(Ws), I.*Mk) ./ Norm;
      localVar = filter2(ones(Ws), (I.*Mk).^2) ./ Norm -localMean.^2;




if inses
	Norm_1=(Norm-1)+((Norm-1)==0);
	CN=(Norm)./(Norm_1);
	Vl=localVar.*CN;
else
	Vl=localVar;
end
