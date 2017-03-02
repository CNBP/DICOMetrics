function Vl=localvar3D_mask(I,mask,Ws,inses)
% varlocal   Local variance
%
%Vl=varlocal3D_mask(I,mask,Ws,inses)
%
%    INPUT:
%
%	- I: input image    
%       - mask: Threshold or image
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
if length(mask)==1
	Mk=(I>mask);
else
	Mk=mask;
	if ndims(Mk)<ndims(I)
	   Mk=repmat(Mk,[1,1,Mz]);
	end
end
if length(Ws)==2

   for ii=1:Mz
      Norm(:,:,ii)=filter2(ones(Ws), Mk(:,:,ii));
      Norm(:,:,ii)=Norm(:,:,ii)+((Norm(:,:,ii))==0);
      localMean(:,:,ii) = filter2(ones(Ws), I(:,:,ii).*Mk(:,:,ii)) ./ Norm(:,:,ii);
      localVar(:,:,ii) = filter2(ones(Ws), (I(:,:,ii).*Mk(:,:,ii)).^2) ./ Norm(:,:,ii) -localMean(:,:,ii).^2;
   end

else
   Norm=convn(Mk,ones(Ws),'same');
   Norm=Norm+(Norm==0);
   localMean = convn((I.*Mk),ones(Ws),'same') ./ Norm;
   localVar  = convn((I.*Mk).^2,ones(Ws),'same') ./ Norm -localMean.^2;


end

if inses
	Norm_1=(Norm-1)+((Norm-1)==0);
	CN=(Norm)./(Norm_1);
	Vl=localVar.*CN;
else
	Vl=localVar;
end
