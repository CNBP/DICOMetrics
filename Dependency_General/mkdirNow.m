function NowDirectory = mkdirNow()
% Make a directory based on the CURRENT execution time, does not enter the directory. 
%This serves as the MASTER variable/settings ini file.
%
% Syntax:  [output1,output2] = function_name(input1,input2,input3)
%
% Inputs:
%    	none
%
% Outputs:
%    	NowDirectory			- the name of the directory being generated.
%
% Example:
%    	Line 1 of example

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
NowDirectory = char(datetime('now','format','yyyy-MM-dd_HH-mm-ss'));
mkdir(NowDirectory);
return;
%------------- END OF CODE --------------
