function printcat(varargin)
% NAME - print... because Matlab print a few variables are messy
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
% 2017; Last revision: 2017-10-03 14:15:02 Eastern Time

%------------- BEGIN CODE --------------

% Courtesy of https://stackoverflow.com/questions/7656576/matlab-console-output

str = '';
for k=1:length(varargin)
    str = [str ' ' num2str(varargin{k})];
end
disp(str)

%------------- END OF CODE --------------
end
