function am=argmin(V)
% ARGMIN  argugument that minimize matrix
%
%    am=ARGMIN(V) calculates position of the minimum value
%    of matrix V
%
%   Author: Santiago Aja Fernandez
%   www.lpi.tel.uva.es/~santi
%   LOCAL STATISTICS TOOLBOX 
%
%   Modified: Feb 01 2008
%
[a,b]=min(V(:));

am=b;
