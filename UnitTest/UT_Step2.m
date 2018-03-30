function Output = UT_Step2()
% NAME - DESCRIPTION
%
% Syntax:  [output1,output2] = function_name(input1,input2,input3)
%
% Inputs:
%    	input1 			- Description
%    	input2 			- Description
%    	input3 			- Description
%
% Outputs:
%    	output1			- Description
%    	output2			- Description
%
% Example:
%    	Line 1 of example
%    	Line 2 of example
%    	Line 3 of example
%
% Other m-files required: 		none
% Subfunctions: 				none
% MAT-files required: 			none
%
% See also: OTHER_FUNCTION_NAME1,  OTHER_FUNCTION_NAME2

% Author: Yang Ding
% All works sponsored by Dr. Gregory Lodygensky and the Canadian Neonatal Brain Platform
% Saint. Justine Hospital, Montreal, Quebec,
% email address: it@cnbp.ca
% Website: http://cnbp.ca
% 2018; Last revision:

%------------- BEGIN CODE --------------

clc;
clear;

% Get Main path;
path                  = uigetdir;

cd(path)

%Load typical settings.
Settings = LoadConfigVariables();



%Load label:
%cd (Settings.Folder.Result);
%label = csvread('BDPLabel1.csv');

cd (Settings.Folder.Result);
label = csvread('BDPLabel2.csv');



% Enter Metrics folder.
cd (Settings.Folder.BDPMetrics);
load('MetricsMatrix.mat');
Metrics = MetricsMatrix;

% Must check Metrics dimention vs labelPath size dimension
if (checkSize(Metrics,label))
  % Step 2:
  ClassificationSummary = Step2ClassifiersTests(Metrics,label);

else
  error('Data metrics and/or Data Class Label size mistmatch/emtpy. Please double check those two variables. ')
end

Output = {Metrics, ClassificationSummary};

%------------- END OF CODE --------------
end
