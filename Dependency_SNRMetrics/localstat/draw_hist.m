function pinta_hist(F,Nbins,maxim,fig,arg)

%DRAWS histogram

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
