function Metric = EvaluateLiveLabMetrics(Image,AlgoChoice)
%EvaluateLiveLabMetrics - % This function loads a regular image try to parse it properly to the format and then send it to a bunch of LiveLab image quality processing utilities.. 
%
% Syntax:  Metric = EvaluateLiveLabMetrics(Image,AlgoChoice)
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

	%Get current path. 
	scriptName = mfilename('fullpath');
	[currentpath, filename, fileextension]= fileparts(scriptName);

	% Ensure dependencies are properly referred to
	addpath(genpath('Dependency_LiveLab'));	

	%Input QC Check
	if(~isnumeric(AlgoChoice))
		Metric = [];
		return
	end 
		
		
	% from this point onward input must be a grayscale image	
	switch AlgoChoice

		case 1 % BIQI 
			Metric = biqi(Image)
		
		case 2 % BRISQUE
			glcms = graycomatrix(Image);
			stats = graycoprops(glcms);		
			Metric = stats.Contrast;
			  
		case 3 % DIIVINE
			glcms = graycomatrix(Image);
			stats = graycoprops(glcms);
			Metric = stats.Correlation
			   
		case 4 % GRNN
			glcms = graycomatrix(Image);
			stats = graycoprops(glcms);
			Metric = stats.Energy
			   
		otherwise
			Metric = [];
			return 
	end

%------------- END OF CODE --------------
end        





























