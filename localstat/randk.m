function [M]=randk(Sz,sigma,alpha)
% Random k data generator
%   Author: Santiago Aja Fernandez
%   www.lpi.tel.uva.es/~santi
%   LOCAL STATISTICS TOOLBOX 
%
%   Modified: Feb 01 2008
%
sigma=sigma/sqrt(alpha);

if length(Sz)==1
	Sz=[Sz Sz];
end

N1=(sigma./sqrt(2*alpha)).*randn([Sz,round(2.*alpha)]);
N2=(sigma./sqrt(2*alpha)).*randn([Sz,2]);
V=sqrt(sum(2.*alpha.*N1.^2,length(Sz)+1));
U=sqrt(alpha/(sigma^2)).*sqrt(sum(N2.^2,length(Sz)+1));

M=U.*V;

%b=sqrt(4.*alpha./(2.*sigma.^2));
%p_x=2.*b.*(x.*b./2).^(alpha).*besselk(alpha-1,b.*x)./gamma(alpha);
