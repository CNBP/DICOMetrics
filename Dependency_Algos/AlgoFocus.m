function [Name, Count] = AlgoFocus(Index)
% NAME - This function returns the name of the specific index requested as well as the count of all current AlgoFocus implemented.
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
% 2017; Last revision: 2017-10-03 11:32:48 Eastern Time

%TODO: make sure to look into the not implemented function here!

AlgoFocus{ 1} = 'Focus_ACMO';
AlgoFocus{ 2} = 'Focus_BREN';
AlgoFocus{ 3} = 'Focus_NotImplemented';
AlgoFocus{ 4} = 'Focus_CURV';
AlgoFocus{ 5} = 'Focus_NotImplemented';
AlgoFocus{ 6} = 'Focus_NotImplemented';
AlgoFocus{ 7} = 'Focus_GDER';
AlgoFocus{ 8} = 'Focus_GLVA';
AlgoFocus{ 9} = 'Focus_GLLV';
AlgoFocus{10} = 'Focus_GLVN';
AlgoFocus{11} = 'Focus_GRAE';
AlgoFocus{12} = 'Focus_GRAT';
AlgoFocus{13} = 'Focus_GRAS';
AlgoFocus{14} = 'Focus_HELM';
AlgoFocus{15} = 'Focus_HISE';
AlgoFocus{16} = 'Focus_HISR';
AlgoFocus{17} = 'Focus_LAPE';
AlgoFocus{18} = 'Focus_LAPM';
AlgoFocus{19} = 'Focus_LAPV';
AlgoFocus{20} = 'Focus_LAPD';
AlgoFocus{21} = 'Focus_SFIL';
AlgoFocus{22} = 'Focus_SFRQ';
AlgoFocus{23} = 'Focus_TENG';
AlgoFocus{24} = 'Focus_TENV';
AlgoFocus{25} = 'Focus_VOLA';
AlgoFocus{26} = 'Focus_WAVS';
AlgoFocus{27} = 'Focus_WAVV';
AlgoFocus{28} = 'Focus_WAVR';

[Name, Count] = AlgoName(AlgoFocus,Index);

%------------- END OF CODE --------------
end
