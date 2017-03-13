function Metric = EvaluateTextureMetrics(Image,AlgoChoice)
%EvaluateTextureMetrics - % This function loads a regular image try to parse it properly to the format and then send it to a bunch of texture image quality processing processing facility. 
%
% Syntax:  Metric = EvaluateTextureMetrics(Image,AlgoChoice)
%
% Inputs:
%    	Image 			- this is the grayscale level image has been passed to be processed and summarized
%    	AlgoChoice		- a number indicate which algorithm to be used
%			
% Outputs:			
%    	Metric			- metric is the single summary of texture  metric calculated based on algorithm of choice
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
	if(~isnumeric(AlgoChoice))
		Metric = [];
		return
	end 
		
		
	% from this point onward input must be a grayscale image	
	switch AlgoChoice

		case 1 % Matlab Entropy
			Metric = entropy(Image)
		
		case 2 % GLCM Contrast
			glcms = graycomatrix(Image);
			stats = graycoprops(glcms);		
			Metric = stats.Contrast;
			  
		case 3 % GLCM Correlation
			glcms = graycomatrix(Image);
			stats = graycoprops(glcms);
			Metric = stats.Correlation
			   
		case 4 % GLCM Energy
			glcms = graycomatrix(Image);
			stats = graycoprops(glcms);
			Metric = stats.Energy
			   
		case 5 % GLCM Homogeneity
			glcms = graycomatrix(Image);
			stats = graycoprops(glcms);
			Metric = stats.Homogeneity
			   
		otherwise
			Metric = [];
			return 
	end

%------------- END OF CODE --------------
end        





























