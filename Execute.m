% Main Analyses Script. 

% Author: Yang Ding
% All works sponsored by Dr. Gregory Lodygensky and the Canadian Neonatal Brain Platform
% Saint. Justine Hospital, Montreal, Quebec, 
% email address: it@cnbp.ca
% Website: http://cnbp.ca
% 2017-03; Last revision: 10:02 PM March 20, 2017

%------------- BEGIN CODE --------------

clc;
clear;

Output = RecursivelyLoadDICOM();

% Get current path of current script. 
scriptName = mfilename('fullpath');
[currentpath, filename, fileextension]= fileparts(scriptName);

% Ensure dependencies are properly referred to
addpath(currentpath);
addpath(genpath([currentpath,'\Classification']));

Classification = RecursivelyLoadAnalyzeResults(Output);

%------------- END OF CODE --------------
