function TextureMetric = EvaluateTextureMetrics(Image,AlgoIndex)
%EvaluateTextureMetrics - % This function loads a regular image try to parse it properly to the format and then send it to a bunch of texture image quality processing processing facility. 
%
% Syntax:  TextureMetric = EvaluateTextureMetrics(Image,AlgoIndex)
%
% Inputs:
%    	Image 			- this is the grayscale level image has been passed to be processed and summarized
%    	AlgoIndex		- a number indicate which algorithm to be used
%			
% Outputs:			
%    	TextureMetric			- TextureMetric is the single summary of texture  TextureMetric calculated based on algorithm of choice
%
% Example: 
%    	Line 1 of example
%    	Line 2 of example
%    	Line 3 of example
%
% Other m-files required: 		mostly other Matlab built-in existing functions
% Subfunctions: 				none
% MAT-files required: 			none
%
% See also: OTHER_FUNCTION_NAME1,  OTHER_FUNCTION_NAME2

% Author: Yang Ding
% All works sponsored by Dr. Gregory Lodygensky and the Canadian Neonatal Brain Platform
% Saint. Justine Hospital, Montreal, Quebec, 
% email address: it@cnbp.ca
% Website: http://cnbp.ca
% 2017-03; Last revision: 10:39 AM 2017-03-02

%------------- BEGIN CODE --------------

	% ImageInBuffer = imread(InputImage);
	% InputRGBImageDouble = im2double(ImageInBuffer);
	% %Image = rgb2gray(InputRGBImageDouble);
	% Image = InputRGBImageDouble;

	%Input QC Check
	if(~isnumeric(AlgoIndex))
		TextureMetric = [];
		return
	end 
		
		
	% from this point onward input must be a grayscale image	
	switch AlgoIndex

		case 1 % Matlab Entropy
			TextureMetric = entropy(Image);
		
		case 2 % GLCM Contrast
			glcms = graycomatrix(Image);
			stats = graycoprops(glcms);		
			TextureMetric = stats.Contrast;
			  
		case 3 % GLCM Correlation
			glcms = graycomatrix(Image);
			stats = graycoprops(glcms);
			TextureMetric = stats.Correlation;
			   
		case 4 % GLCM Energy
			glcms = graycomatrix(Image);
			stats = graycoprops(glcms);
			TextureMetric = stats.Energy;
			   
		case 5 % GLCM Homogeneity
			glcms = graycomatrix(Image);
			stats = graycoprops(glcms);
			TextureMetric = stats.Homogeneity;
			   
		otherwise
			TextureMetric = [];
			return 
	end

%------------- END OF CODE --------------
end        





























