function [Name, Count] = AlgoSNR(Index)
% NAME - DESCRIPTION
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
% 2017; Last revision: 2017-10-03 11:49:02 Eastern Time
%TODO: better rename AJANE 1 to 4.
%TODO: add note about the default Bin Number.

AlgoSNR{ 1} = 'SNR_AjaNE1';
AlgoSNR{ 2} = 'SNR_AjaNE2';
AlgoSNR{ 3} = 'SNR_AjaNE3';
AlgoSNR{ 4} = 'SNR_AjaNE4';
AlgoSNR{ 5} = 'SNR_Brummer';
AlgoSNR{ 6} = 'SNR_Chang';
AlgoSNR{ 7} = 'SNR_noise_M1';
AlgoSNR{ 8} = 'SNR_noise_M2';
AlgoSNR{ 9} = 'SNR_MRI_lmmse';
AlgoSNR{10} = 'SNR_MeanImage';
AlgoSNR{11} = 'SNR_MeanC50x50';
AlgoSNR{12} = 'SNR_MeanC100x100';
AlgoSNR{13} = 'SNR_LogImage';
AlgoSNR{14} = 'SNR_LogC50x50';
AlgoSNR{15} = 'SNR_LogC100x100';

[Name, Count] = AlgoName(AlgoSNR,Index);
%------------- END OF CODE --------------
end
