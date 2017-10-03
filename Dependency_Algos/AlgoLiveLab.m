function [Name, Count] = AlgoLiveLab(Index)
% NAME - This function returns the name of the specific index requested as well as the count of all current LiveLab algorithm implemented.
%
% Syntax:  []] = AlgoTemplater(1,0)
%
% Inputs:
%    	TypeIndex 			- Input about the type of algorithms in general.
%    	AlgoIndex 			- Input about the algorithm in general. (if 0, return count of the typeindex)
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
% 2017; Last revision: 2017-10-03 11:56:08 Eastern Time

AlgoFocus{ 1} = 'BIQI';
AlgoFocus{ 2} = 'BRISQUE';

%Store Count!
[column Count] = size(AlgoFocus);

%If valid index, store name as well.
if (0 < index && index < Count && isinteger(index)){
  Name = AlgoFocus{Index}
} else {
  Name = 'Invalid'
}

%------------- END OF CODE --------------
end
