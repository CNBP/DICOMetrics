function [Name, Count] = AlgoNSS(Index)
% NAME - This function returns the name of the specific index requested as well as the count of all current NSS algorithm implemented.
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

AlgoNSS{ 1} = 'NSS_BIQI';
AlgoNSS{ 2} = 'NSS_BRISQUE';
AlgoNSS{ 3} = 'NSS_JP2KNR';
AlgoNSS{ 4} = 'NSS_NIQE';
AlgoNSS{ 5} = 'NSS_SSEQ';
AlgoNSS{ 6} = 'MSS_MatLabBRISQUE';
AlgoNSS{ 7} = 'MSS_MatLabNIQE';

[Name, Count] = AlgoName(AlgoNSS,Index);

%------------- END OF CODE --------------
end
