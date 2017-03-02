function [f,noise,localVar] = wienerC(g,varargin)
%WIENERC Perform 2-D adaptive noise-removal filtering.
%
%  Modified MATLAB Wiener filtering with alternative
%  noise estimation techniques (for additive Gaussian noise)
%
%
%		'Moda':    Estimation with mode
%		'Med':     Estimation with median
%               'Min':     Estimation with minimum
%		'Mad':	   Median absolute deviation
%
% if 'inses' is added, the estimation of the variance is done 
% over N-1 points
%
% Default estimation window=[3,3]. If 'big', [Wx Wy] is added
% estimation is done over a different window.
%
% Author: Santiago Aja Fernandez
% LOCAL STATISTICS TOOLBOX 
%
% Modified: Feb 01 2008
%
% Uses algorithm developed by Lee (1980).
% Reference: "Two-Dimensional Signal and Image Processing" by 
% Jae S. Lim, pp.536-540.

[nhood, block, noise, msg,estim,inses] = ParseInputs(varargin{:});

if (~isempty(msg))
  error(msg);
end

classin = class(g);
classChanged = 0;
if ~isa(g, 'double')
  classChanged = 1;
  g = im2double(g);
end

% Estimate the local mean of f.
localMean = filter2(ones(nhood), g) / prod(nhood);
% Estimate of the local variance of f.
localVar = filter2(ones(nhood), g.^2) / prod(nhood) - localMean.^2;

if inses
	localVar=(((nhood(1)*nhood(2)))./(nhood(1)*nhood(2))-1).*localVar;
end

% Estimate the noise power if necessary.
if (isempty(noise))
  if estim==2 		
 		noise = moda(localVar,1000);
		%if noise<=1.7
		%	noise=0;
		%end
  elseif estim==3
  		noise=median(localVar(:));
  elseif estim==4
  		noise=min(localVar(:));
  elseif estim==5
	       [CA,CH,CV,CD] =dwt2(g,'haar');
                noise=(1.4826.*median(abs(CH(:)-median(CH(:))))).^2;
  else
  		noise = mean2(localVar);
  end
noise=max(noise,0.0001);  
end

% Compute result
% f = localMean + (max(0, localVar - noise) ./ ...
%           max(localVar, noise)) .* (g - localMean);
%
% Computation is split up to minimize use of memory
% for temp arrays.
f = g - localMean;
g = localVar - noise; 
g = max(g, 0);
localVar = max(localVar, noise);
f = f ./ localVar;
f = f .* g;
f = f + localMean;

if classChanged,
  f = changeclass(classin, f);
end


%%%-----------------------------------------------------------
%%% Subfunction ParseInputs
%%%

function [nhood, block, noise, msg,estim,inses] = ParseInputs(varargin)

g = [];
nhood = [3 3];
block = [];
noise = [];
msg = '';
estim=1;
inses=0;
dfsteppos = -1;

for i=1:length(varargin)

	flag =0;
	if i == dfsteppos
     	flag = 1;
   	end
	if(isstr(varargin{i}))
		if strcmp(varargin{i},'Moda')
      		estim=2;
      		flag = 1;
		elseif strcmp(varargin{i},'Med')
	  		estim=3;
      		flag = 1;
		elseif strcmp(varargin{i},'Min')
	  		estim=4;
      		flag = 1; 
		elseif strcmp(varargin{i},'Mad')
	  		estim=5;
      		flag = 1; 
    		elseif strcmp(varargin{i},'inses')
	 		inses=1;
      		flag = 1;   
		elseif strcmp(varargin{i},'big')
	  		big=1;
      		flag = 1;    
	  		nhood= varargin{i+1};
      		dfsteppos = i+1;
			flag = 1;
			end
	else
			nhood = varargin{i};
			flag = 1;
			
	end
	if flag == 0
      error('Too many parameters !')
      return
   end
end

	  

% checking if input image is a truecolor image-not supported by WIENER2
%if (ndims(g) == 3)
%    msg = 'WIENER2 does not support 3D truecolor images as an input.';
%    return;
%end;

%if (isempty(block))
%    block = bestblk(size(g));
%end
