function draw_hist(F,Nbins,maxim,fig,arg)
% DRAW_HIST estimates and draws histogram of data
%
% Estimates the histogram of data F and draws is in Fig.
%
% INPUT:
%	F: input data
% 	Nbins: Number of bins in histogram (default 0)
%	maxim: if maxim=1, normalize the hisotgram by maximum value
%	fig: number of figure to plot histogram
%	arg: arguments for the plot
%
%   Author: Santiago Aja Fernandez
%   www.lpi.tel.uva.es/~santi
%   LOCAL STATISTICS TOOLBOX 
%
%   Modified: Feb 01 2008
%
if exist('Nbins')==0
  Nbins=100;
end

[h,x]=hist(F(:),Nbins);

if exist('fig')
figure(fig)
end

if exist('maxim')==0
  maxim=0;
end

if maxim
   h=h./max(h);
end

if exist('arg')
	plot(x,h,arg)
else
	plot(x,h)
end
