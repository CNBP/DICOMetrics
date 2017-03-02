function Vl=varlocal3D(I,Ws,inses)
% varlocal   Local variance
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

if length(Ws)==2

   for ii=1:Mz
      localMean(:,:,ii) = filter2(ones(Ws), I(:,:,ii)) / prod(Ws);
      localVar(:,:,ii) = filter2(ones(Ws), I(:,:,ii).^2) / prod(Ws) -localMean(:,:,ii).^2;
   end

else
   localMean = convn(I,ones(Ws),'same') / prod(Ws);
   localVar  = convn(I.^2,ones(Ws),'same') / prod(Ws) -localMean.^2;


end

if inses
	CN=(prod(Ws))./(prod(Ws)-1);
	Vl=localVar.*CN;
else
	Vl=localVar;
end
