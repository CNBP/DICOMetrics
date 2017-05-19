function Output = Config()
%Config - Return the config structure that is used by all other function 
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
FileRecords 	= 1;
FocusMetrics 	= 2;
SNRMetrics 		= 3;
TextureMetrics 	= 4;
NSSMetrics 	= 5;

% Elaborate on the specific numbers of metrics loop that are required to calculated these metrics
NbFocusMetrics 		= 28;
NbSNRMetrics 		= 15;
NbTextureMetrics 	= 5;
NbNSSMetrics 	= 2;

NbMetrics(FileRecords)      = 1;
NbMetrics(FocusMetrics) 	= NbFocusMetrics;
NbMetrics(SNRMetrics) 		= NbSNRMetrics;
NbMetrics(TextureMetrics) 	= NbTextureMetrics;
NbMetrics(NSSMetrics) 	= NbNSSMetrics;

% total number of metric types
NbMetricTypes = 5;

%------------- END OF CODE --------------
