function Vl=varlocal(I,Ws,inses)
% VARLOCAL   Local variance
%
% V=VARLOCAL(I, Ws, inses) estimates the local variance in a
%    neighborhood around each pixel.
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
localMean = filter2(ones(Ws), I) / prod(Ws);
localVar = filter2(ones(Ws), I.^2) / prod(Ws) -localMean.^2;

if inses
	CN=(Ws(1)*Ws(2))./((Ws(1)*Ws(2))-1);
	Vl=localVar.*CN;
else
	Vl=localVar;
end
