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

	%Get current path.
	scriptName = mfilename('fullpath');
	[currentpath, filename, fileextension]= fileparts(scriptName);

	% Ensure dependencies are properly referred to
	addpath(genpath([currentpath,'\Dependency_TextureMetrics']));

	%50 pixels down range for horizontal pattern detection.
	HorizontalOffset = [zeros(50,1) (1:50)'];

	%50 pixels down range for horizontal pattern detection.
	VerticalOffset = [(1:50)' zeros(50,1)];

	%TODO: rewrite the Evaluate texture metrics to use parallel computing of multiple metrics. 

	% from this point onward input must be a grayscale image
	switch AlgoIndex

		case 1 % Matlab Entropy
			TextureMetric = entropy(Image);

		case 2 % GLCM Autocorrelation
			glcms = graycomatrix(Image, 'G',[]);
			stats = GLCM_Features1(glcms);
			TextureMetric = stats.autoc;

		case 3 % GLCM Contrast
			glcms = graycomatrix(Image, 'G',[]);
			stats = GLCM_Features1(glcms);
			TextureMetric = stats.contr;

		case 4 % GLCM CorrM
			glcms = graycomatrix(Image, 'G',[]);
			stats = GLCM_Features1(glcms);
			TextureMetric = stats.corrm;

		case 5 % GLCM CorrP
			glcms = graycomatrix(Image, 'G',[]);
			stats = GLCM_Features1(glcms);
			TextureMetric = stats.corrp;

		case 6 % GLCM CProm
			glcms = graycomatrix(Image, 'G',[]);
			stats = GLCM_Features1(glcms);
			TextureMetric = stats.cprom;

		case 7 % GLCM CShad
			glcms = graycomatrix(Image, 'G',[]);
			stats = GLCM_Features1(glcms);
			TextureMetric = stats.cshad;

		case 8 % GLCM Dissi
			glcms = graycomatrix(Image, 'G',[]);
			stats = GLCM_Features1(glcms);
			TextureMetric = stats.dissi;

		case 9 % GLCM Energy
			glcms = graycomatrix(Image, 'G',[]);
			stats = GLCM_Features1(glcms);
			TextureMetric = stats.energ;

		case 10 % GLCM Entropy
			glcms = graycomatrix(Image, 'G',[]);
			stats = GLCM_Features1(glcms);
			TextureMetric = stats.entro;

		case 11 % GLCM Homom
			glcms = graycomatrix(Image, 'G',[]);
			stats = GLCM_Features1(glcms);
			TextureMetric = stats.homom;

		case 12 % GLCM HomoP
			glcms = graycomatrix(Image, 'G',[]);
			stats = GLCM_Features1(glcms);
			TextureMetric = stats.homop;

		case 13 % GLCM MaxPR
			glcms = graycomatrix(Image, 'G',[]);
			stats = GLCM_Features1(glcms);
			TextureMetric = stats.maxpr;

		case 14 % GLCM SOSVH
			glcms = graycomatrix(Image, 'G',[]);
			stats = GLCM_Features1(glcms);
			TextureMetric = stats.sosvh;

		case 15 % GLCM Savgh
			glcms = graycomatrix(Image, 'G',[]);
			stats = GLCM_Features1(glcms);
			TextureMetric = stats.savgh;

		case 16 % GLCM Svarh
			glcms = graycomatrix(Image, 'G',[]);
			stats = GLCM_Features1(glcms);
			TextureMetric = stats.svarh;

		case 17 % GLCM Senth
			glcms = graycomatrix(Image, 'G',[]);
			stats = GLCM_Features1(glcms);
			TextureMetric = stats.senth;

		case 18 % GLCM Dvarh
			glcms = graycomatrix(Image, 'G',[]);
			stats = GLCM_Features1(glcms);
			TextureMetric = stats.dvarh;

		case 19 % GLCM Denth
			glcms = graycomatrix(Image, 'G',[]);
			stats = GLCM_Features1(glcms);
			TextureMetric = stats.denth;

		case 20 % Inf1H
			glcms = graycomatrix(Image, 'G',[]);
			stats = GLCM_Features1(glcms);
			TextureMetric = stats.inf1h;

		case 21 % Inf2h
			glcms = graycomatrix(Image, 'G',[]);
			stats = GLCM_Features1(glcms);
			TextureMetric = stats.inf2h;

		case 22 % indnc
			glcms = graycomatrix(Image, 'G',[]);
			stats = GLCM_Features1(glcms);
			TextureMetric = stats.indnc;

		case 23 % idmnc
			glcms = graycomatrix(Image, 'G',[]);
			stats = GLCM_Features1(glcms);
			TextureMetric = stats.idmnc;

		otherwise
			TextureMetric = [];
			return
	end

%------------- END OF CODE --------------
end
