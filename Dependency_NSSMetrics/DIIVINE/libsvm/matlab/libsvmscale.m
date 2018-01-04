function [ y ] = libsvmscale( x, scale,lu )
%LIBSVNSCALE Summary of this function goes here
%   Detailed explanation goes here

y=x;
for i=1:size(scale,1)
    idx=scale(i,1);
    l=scale(i,2);
    u=scale(i,3);
    if(idx>0 && l<u)
        y(idx)=(x(idx)-l)/(u-l)*(lu(2)-lu(1))+lu(1);
    end
end

