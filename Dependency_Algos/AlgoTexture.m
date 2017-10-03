function [Name, Count] = AlgoTexture(Index)
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
% 2017; Last revision:

AlgoTexture{ 1} = 'Matlab Entropy';
AlgoTexture{ 2} = 'GLCM Autocorrelation';
AlgoTexture{ 3} = 'GLCM Contrast-matlab';
AlgoTexture{ 4} = 'GLCM Correlation-matlab ';
AlgoTexture{ 5} = 'GLCM Correlation';
AlgoTexture{ 6} = 'GLCM Cluster Prominence';
AlgoTexture{ 7} = 'GLCM Cluster Shade';
AlgoTexture{ 8} = 'GLCM Dissimilarity';
AlgoTexture{ 9} = 'GLCM EneEnergy-matlab';
AlgoTexture{10} = 'GLCM Entropy';
AlgoTexture{11} = 'GLCM Homogeneity-matlab';
AlgoTexture{12} = 'GLCM Homogeneity';
AlgoTexture{13} = 'GLCM aximum probability';
AlgoTexture{14} = 'GLCM Sum of sqaures: Variance';
AlgoTexture{15} = 'GLCM Sum average';
AlgoTexture{16} = 'GLCM Sum variance';
AlgoTexture{17} = 'GLCM Sum entropy ';
AlgoTexture{18} = 'GLCM Difference variance';
AlgoTexture{19} = 'GLCM Difference entropy';
AlgoTexture{20} = 'Information measure of correlation1';
AlgoTexture{21} = 'Informaiton measure of correlation2';
%TODO: Inverse difference (INV) is homom sems to be missing?
AlgoTexture{22} = 'Inverse difference normalized (INN)';
AlgoTexture{23} = 'Inverse difference moment normalize';

[Name, Count] = AlgoName(AlgoTexture,Index);

%------------- END OF CODE --------------
end
