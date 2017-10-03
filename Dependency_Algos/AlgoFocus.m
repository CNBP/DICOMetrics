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

AlgoFocus{ 1} = 'ACMO';
AlgoFocus{ 2} = 'BREN';
AlgoFocus{ 3} = 'NotImplemented';
AlgoFocus{ 4} = 'CURV';
AlgoFocus{ 5} = 'NotImplemented';
AlgoFocus{ 6} = 'NotImplemented';
AlgoFocus{ 7} = 'GDER';
AlgoFocus{ 8} = 'GLVA';
AlgoFocus{ 9} = 'GLLV';
AlgoFocus{10} = 'GLVN';
AlgoFocus{11} = 'GRAE';
AlgoFocus{12} = 'GRAT';
AlgoFocus{13} = 'GRAS';
AlgoFocus{14} = 'HELM';
AlgoFocus{15} = 'HISE';
AlgoFocus{16} = 'HISR';
AlgoFocus{17} = 'LAPE';
AlgoFocus{18} = 'LAPM';
AlgoFocus{19} = 'LAPV';
AlgoFocus{20} = 'LAPD';
AlgoFocus{21} = 'SFIL';
AlgoFocus{22} = 'SFRQ';
AlgoFocus{23} = 'TENG';
AlgoFocus{24} = 'TENV';
AlgoFocus{25} = 'VOLA';
AlgoFocus{26} = 'WAVS';
AlgoFocus{27} = 'WAVV';
AlgoFocus{28} = 'WAVR';

[Name, Count] = AlgoName(AlgoFocus,Index);

%------------- END OF CODE --------------
end
