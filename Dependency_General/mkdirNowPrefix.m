function NewDir = mkdirNowPrefix(string)
% Make a new directiory with a specific prefix with current execution date time - return the directory name as well.
%
% Syntax:  [output1,output2] = function_name(input1,input2,input3)
%
% Inputs:
%    	string 			- the prefix to be before the actual date.
%
% Outputs:
%    	NewDir			- the directory folder that is to be created.
%
% Example:
%    	Line 1 of example
%
% Other m-files required: 		none
% Subfunctions: 				  none
% MAT-files required: 			none
%
% See also: mkdirNow

% Author: Yang Ding
% All works sponsored by Dr. Gregory Lodygensky and the Canadian Neonatal Brain Platform
% Saint. Justine Hospital, Montreal, Quebec,
% email address: it@cnbp.ca
% Website: http://cnbp.ca
% 2017-03; Last revision: 2017-08-14 21:46:14 Eastern Time

%------------- BEGIN CODE --------------
NowDirectory = char(datetime('now','format','yyyy-MM-dd_HH-mm-ss'));
NewDir = [string '-' NowDirectory];
mkdir(NewDir);

end
%------------- END OF CODE --------------
