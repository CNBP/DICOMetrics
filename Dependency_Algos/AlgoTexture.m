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

AlgoTexture{ 1} = 'Texture_Matlab Entropy';
AlgoTexture{ 2} = 'Texture_GLCM Autocorrelation';
AlgoTexture{ 3} = 'Texture_GLCM Contrast-matlab';
AlgoTexture{ 4} = 'Texture_GLCM Correlation-matlab ';
AlgoTexture{ 5} = 'Texture_GLCM Correlation';
AlgoTexture{ 6} = 'Texture_GLCM Cluster Prominence';
AlgoTexture{ 7} = 'Texture_GLCM Cluster Shade';
AlgoTexture{ 8} = 'Texture_GLCM Dissimilarity';
AlgoTexture{ 9} = 'Texture_GLCM Energy-matlab';
AlgoTexture{10} = 'Texture_GLCM Entropy';
AlgoTexture{11} = 'Texture_GLCM Homogeneity-matlab';
AlgoTexture{12} = 'Texture_GLCM Homogeneity';
AlgoTexture{13} = 'Texture_GLCM aximum probability';
AlgoTexture{14} = 'Texture_GLCM Sum of sqaures: Variance';
AlgoTexture{15} = 'Texture_GLCM Sum average';
AlgoTexture{16} = 'Texture_GLCM Sum variance';
AlgoTexture{17} = 'Texture_GLCM Sum entropy ';
AlgoTexture{18} = 'Texture_GLCM Difference variance';
AlgoTexture{19} = 'Texture_GLCM Difference entropy';
AlgoTexture{20} = 'Texture_Information measure of correlation1';
AlgoTexture{21} = 'Texture_Informaiton measure of correlation2';
%TODO: Inverse difference (INV) is homom sems to be missing?
AlgoTexture{22} = 'Texture_Inverse difference normalized (INN)';
AlgoTexture{23} = 'Texture_Inverse difference moment normalize';

[Name, Count] = AlgoName(AlgoTexture,Index);

%------------- END OF CODE --------------
end
