function M=localMAD(I,Wn)

% localMAD local Median Absolute Deviation
%
% Inputs:
%	- I: input image
%       - Ws: Estimation window Ws=[Wx Wy];
%
%   Author: Santiago Aja Fernandez
%   LOCAL STATISTICS TOOLBOX 
%
%   Modified: Feb 01 2008

I=double(I);
Im=medfilt2(I,Wn);
M=medfilt2(abs(I-Im));

