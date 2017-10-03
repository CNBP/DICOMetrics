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

AlgoTexture{ 1} = 'Texture_Entropy_matlab';
AlgoTexture{ 2} = 'Texture_GLCM_Autocorrelation';
AlgoTexture{ 3} = 'Texture_GLCM_Contrast_matlab';
AlgoTexture{ 4} = 'Texture_GLCM_Correlation_matlab ';
AlgoTexture{ 5} = 'Texture_GLCM_Correlation';
AlgoTexture{ 6} = 'Texture_GLCM_Cluster_Prominence';
AlgoTexture{ 7} = 'Texture_GLCM_Cluster_Shade';
AlgoTexture{ 8} = 'Texture_GLCM_Dissimilarity';
AlgoTexture{ 9} = 'Texture_GLCM_Energy_matlab';
AlgoTexture{10} = 'Texture_GLCM_Entropy';
AlgoTexture{11} = 'Texture_GLCM_Homogeneity_matlab';
AlgoTexture{12} = 'Texture_GLCM_Homogeneity';
AlgoTexture{13} = 'Texture_GLCM_Maximum_probability';
AlgoTexture{14} = 'Texture_GLCM_SumOfSqaures_Variance';
AlgoTexture{15} = 'Texture_GLCM_Sum_average';
AlgoTexture{16} = 'Texture_GLCM_Sum_variance';
AlgoTexture{17} = 'Texture_GLCM_Sum_entropy ';
AlgoTexture{18} = 'Texture_GLCM_Difference_variance';
AlgoTexture{19} = 'Texture_GLCM_Difference_entropy';
AlgoTexture{20} = 'Texture_Info_measure_of_correlation1';
AlgoTexture{21} = 'Texture_Info_measure_of_correlation2';
%TODO: Inverse difference (INV) is homom sems to be missing?
AlgoTexture{22} = 'Texture_Inverse_diff_normalized';
AlgoTexture{23} = 'Texture_Inverse_diff_moment_normalized';

[Name, Count] = AlgoName(AlgoTexture,Index);

%------------- END OF CODE --------------
end
