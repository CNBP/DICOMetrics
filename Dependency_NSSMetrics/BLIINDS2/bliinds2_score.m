function [ score ] = bliinds2_score( image )
%
%
% Syntax:  [score ] = bliinds2_score(image)
%
% Inputs:
%    	image 			- image read using imread
%			
% Outputs:			
%    	score			- BLIND score 
%
% Example: 

%    	Then
%    	Line 3 of example
%
% Other m-files required: 		bliinds2_feature_extraction, bliinds_prediction
% Subfunctions: 				none
% MAT-files required: 			none
%
% See also: OTHER_FUNCTION_NAME1,  OTHER_FUNCTION_NAME2

% Author: Yang Ding, adapted from Greg Freeman's script at https://github.com/gregfreeman/image_quality_toolbox/tree/master/%2Bbliinds2
% All works sponsored by Dr. Gregory Lodygensky and the Canadian Neonatal Brain Platform
% Saint. Justine Hospital, Montreal, Quebec, 
% email address: it@cnbp.ca
% Website: http://cnbp.ca
% 2017-05; Last revision: 1:07 AM 2017-05-24

%------------- BEGIN CODE --------------  

	% Compute Features
    features = bliinds2_feature_extraction(image);
	
	%Adjust the features before sending it to prediction per suggestion here: https://www.mathworks.com/matlabcentral/answers/104617-error-using-horzcat-cat-arguments-dimensions-are-not-consistent
	NewFeatures = reshape(features,1,24);
	
	%Compute and return score. 
    score = bliinds_prediction(NewFeatures);
	
%------------- END OF CODE --------------
end