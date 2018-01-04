function [ r, lu ] = libsvmreadrange( filename )
%LIBSVMREADRANGE Summary of this function goes here
%   Detailed explanation goes here

fid=fopen(filename,'r');
fgetl(fid); %discard line 1
str=fgetl(fid); %read line 2
lu=str2num(str);
r=zeros(0,3);
while ~feof(fid)
    str=fgetl(fid);
    ri=str2num(str);
    r=[r;ri];
end

