function localMean=localmean3D_mask(I,mask,Ws)
%    Local mean
%
%    INPUT:
%
%	- I: input image
%       - Ws: Estimation window Ws=[Wx Wy];
%	- inses: if inses=1 unbiased estimation of Variance
%
%   Author: Santiago Aja Fernandez
%   LOCAL STATISTICS TOOLBOX 
%
%   Modified: Feb 01 2008
%

I=double(I);
[Mx My Mz]=size(I);
Mk=(I>mask);
if length(Ws)==2

   for ii=1:Mz
      Norm(:,:,ii)=filter2(ones(Ws), Mk(:,:,ii));
      Norm(:,:,ii)=Norm(:,:,ii)+((Norm(:,:,ii))==0);
      localMean(:,:,ii) = filter2(ones(Ws), I(:,:,ii).*Mk(:,:,ii)) ./ Norm(:,:,ii);
   end

else
   Norm=convn(Mk,ones(Ws),'same');
   Norm=Norm+(Norm==0);
   localMean = convn((I.*Mk),ones(Ws),'same') ./ Norm;
   


end

