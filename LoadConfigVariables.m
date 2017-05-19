function Output = LoadConfigVariables()
%LoadConfigVariables - Return the config structure that is used by all other function 
%This serves as the MASTER variable/settings ini file. 
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
% 2017-03; Last revision: 10:26 AM 2017-03-02

%------------- BEGIN CODE --------------

%This is the entry function to load all things. 


% Define algorithm types:
Output.IndexFileRecords 	= 1;
Output.IndexFocusMetrics 	= 2;
Output.IndexSNRMetrics 		= 3;
Output.IndexTextureMetrics 	= 4;
Output.IndexNSSMetrics 	= 5;

% Elaborate on the specific numbers of metrics loop that are required to calculated these metrics
Output.NbFocusMetrics 		= 28;
Output.NbSNRMetrics 		= 15;
Output.NbTextureMetrics 	= 23;
Output.NbNSSMetrics 	= 2;

Output.NbMetrics(Output.IndexFileRecords)   = 1;
Output.NbMetrics(Output.IndexFocusMetrics) 	= Output.NbFocusMetrics;
Output.NbMetrics(Output.IndexSNRMetrics) 	= Output.NbSNRMetrics;
Output.NbMetrics(Output.IndexTextureMetrics)= Output.NbTextureMetrics;
Output.NbMetrics(Output.IndexNSSMetrics)= Output.NbNSSMetrics;

% total number of metric types
Output.NbMetricTypes = 5;

%------------- END OF CODE --------------
end