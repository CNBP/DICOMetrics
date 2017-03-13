function Metric = ProcessSingleDICOMInput(Input, AlgoType, Algo)
% ProcessSingleDICOMInput - this function partitioned out  the processing stream depending on the algorithm type specified along with the new numeric index of the algorithm  that is chosen. 
%
% Syntax:  Metric = ProcessSingleDICOMInput(ExampleDoubleGrayScaleImage, SNRMetric, 5)
%
% Inputs:
%    	Input 			- this is still image file in grayscale and in double format matrix
%    	AlgoType 		- this can be one, two or three which correspond to different types of metrics to be calculated, such as focus measure which is one, SNR measure which is two, texture measure which is three
%    	Algo 			- this is the index number of the algorithm that will be implemented
%			
% Outputs:			
%    	Metric			- this is the numerical metric of the relevant algorithm that was chosen to be computed
%
% Example: 
%    	Metric = ProcessSingleDICOMInput(Image, 1, 2)
%
% Other m-files required: 		
% Subfunctions: 				EvaluateFocusMetrics; EvaluateSNRMetrics; EvaluateTextureMetrics
% MAT-files required: 			none
%
% See also: OTHER_FUNCTION_NAME1,  OTHER_FUNCTION_NAME2

% Author: Yang Ding
% All works sponsored by Dr. Gregory Lodygensky and the Canadian Neonatal Brain Platform
% Saint. Justine Hospital, Montreal, Quebec, 
% email address: it@cnbp.ca
% Website: http://cnbp.ca
% 2017-03; Last revision: 10:26 AM 2017-03-02

%------------- BEGIN CODE --------------    

	% Input QC Check
	if(~isnumeric(AlgoChoice))
		Metric = [];
		return
	end 

    % Read image. 
    ImageInBuffer = dicomread(Input);
    
    % Convert image to double. 
    InputDoubleImage = im2double(ImageInBuffer);
    
	% Switch depending on tourism type called the proper evaluation algorithm
	switch (AlgoType)	
		case 2 % Focus Metrics
			Metric = EvaluateFocusMetrics	(InputDoubleImage, Algo);
		
		case 3 % SNR Metrics
			Metric = EvaluateSNRMetrics		(InputDoubleImage, Algo);
		
		case 4 % Texture Metrics
			Metric = EvaluateTextureMetrics	(InputDoubleImage, Algo);
			
		case 5 % LIveLab Metrics
			Metric = EvluateLiveLabMetrics 	(InputDoubleImage, Algo);
	end

	%------------- END OF CODE -------------- 
end 