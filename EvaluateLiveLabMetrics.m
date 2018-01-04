function NSSMetric = EvaluateLiveLabMetrics(Image,AlgoIndex)
%EvaluateLiveLabMetrics - % This function loads a regular image try to parse it properly to the format and then send it to a bunch of NSS image quality processing utilities..
%
% Syntax:  NSSMetric = EvaluateLiveLabMetrics(Image,AlgoIndex)
%
% Inputs:
%    	Image 			- this is the grayscale level image has been passed to be processed and summarized
%    	AlgoIndex		- a number indicate which algorithm to be used
%
% Outputs:
%    	NSSMetric			- NSSMetric is the single summary of texture  NSSMetric calculated based on algorithm of choice
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
	addpath(genpath([currentpath,'\Dependency_NSSMetrics']));

	%Input QC Check
	if(~isnumeric(AlgoIndex))
		NSSMetric = [];
		return
	end


	% from this point onward input must be a grayscale image
	switch AlgoIndex

		case 1 % BIQI
			NSSMetric = biqi(Image);

		case 2 % BRISQUE
			NSSMetric = brisquescore(Image);

		% TODO: implement case 3 % DIIVINE
			% glcms = graycomatrix(Image);
			% stats = graycoprops(glcms);
			% NSSMetric = stats.Correlation

		% TODO: implemented case 4 % GRNN
			% glcms = graycomatrix(Image);
			% stats = graycoprops(glcms);
			% NSSMetric = stats.Energy

		otherwise
			NSSMetric = [];
			return
	end

%------------- END OF CODE --------------
end
