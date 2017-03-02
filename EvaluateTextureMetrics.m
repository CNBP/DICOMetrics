function Metric = EvaluateTextureMetrics(Image,AlgoChoice)
% Author: Yang Ding. 2017-03-02
% This function loads a regular image try to parse it properly to the format and then send it to a bunch of texture image quality processing processing facility. 

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


end        





























