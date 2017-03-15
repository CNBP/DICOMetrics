function SNRMetric = EvaluateSNRMetric(Image,AlgoIndex)

%EvaluateSNRMetric - %This function loads a regular image try to parse it properly to the format and then send it to a bunch of image processing facility. 
%Optional file header info (to give more details about the function than in the H1 line)
%Optional file header info (to give more details about the function than in the H1 line)
%Optional file header info (to give more details about the function than in the H1 line)
%
% Syntax:  SNRMetric = EvaluateSNRMetric(Image,AlgoIndex)
%
% Inputs:
%    	Image 			- Image to be processed. 
%    	AlgoIndex		- Index of algorithm to be used. 
%			
% Outputs:			
%    	SNRMetric		- A numeric summary of the number
%
% Example: 
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
% 2017-03; Last revision: 8:02 AM March 15, 2017

%------------- BEGIN CODE --------------

	%Get current path. 
	scriptName = mfilename('fullpath');
	[currentpath, filename, fileextension]= fileparts(scriptName);

	% Ensure dependencies are properly referred to
	addpath(genpath('Dependency_SNRMetrics'));
	addpath(genpath('Dependency_SNRMetrics/localstat'));


	if(~isnumeric(AlgoIndex))
		SNRMetric = [];
		return
	end 
		
	BinNumber = 1000; %AlgoIndex of Histogram Bins Recommended by Author.

	switch AlgoIndex
		case 1
			SNRMetric = AjaNE(Image,7,BinNumber,1); 
		
		case 2
			SNRMetric = AjaNE(Image,7,BinNumber,2); 
			  
		case 3 
			SNRMetric = AjaNE(Image,7,BinNumber,3); 
			   
		case 4 
			SNRMetric = AjaNE(Image,7,BinNumber,4); 
			   
		case 5 
			SNRMetric = brummer(Image,BinNumber); 
			   
		case 6 
			SNRMetric = chang(Image,7); 
			   
		case 7
			SNRMetric= noise_M1(Image,7,BinNumber);
		
		case 8
			SNRMetric= noise_M2(Image,7,BinNumber);
		
		case 9
			SNRMetric = MRI_lmmse(Image,[7,7]); 
		
		case 10 % Mean signal from the ENTIRE image
			SNRMetric = mean2(Image);
		
		case 11 %Mean Signal from 50 x 50 pixels in the middle of the image
			[Width,Height] = size(Image);
			q1=50; %size of the crop box
			X_Start = floor((Width-q1)/2); % or round instead of floor; using neither gives warning
			X_Stop = X_Start + q1;
			Y_Start = floor((Height-q1)/2);
			Y_Stop = Y_Start + q1;
			Image50 = Image(X_Start:X_Stop, Y_Start:Y_Stop, :);        
			SNRMetric = mean2(Image50);
			
		case 12 %Mean Signal from 100 x 100 pixels in the middle of the image
			[Width,Height] = size(Image);
			q1=100; %size of the crop box
			X_Start = floor((Width-q1)/2); % or round instead of floor; using neither gives warning
			X_Stop = X_Start + q1;
			Y_Start = floor((Height-q1)/2);
			Y_Stop = Y_Start + q1;
			Image100 = Image(X_Start:X_Stop, Y_Start:Y_Stop, :);       
			SNRMetric = mean2(Image100);
		
		case 13 % Total Image SNR
			Noise = MRI_lmmse(Image,[7,7]);          
			Signal = mean2(Image);        
			SNRMetric =  10*log10(Signal / Noise);
		
		case 14 % Mid 50 Square SNR
			Noise = MRI_lmmse(Image,[7,7]);          
			[Width,Height] = size(Image);
			q1=50; %size of the crop box
			X_Start = floor((Width-q1)/2); % or round instead of floor; using neither gives warning
			X_Stop = X_Start + q1;
			Y_Start = floor((Height-q1)/2);
			Y_Stop = Y_Start + q1;
			Image50 = Image(X_Start:X_Stop, Y_Start:Y_Stop, :);        
			Signal = mean2(Image50);        
			SNRMetric = 10*log10(Signal / Noise);
		
		case 15 % Mid 100 Square SNR
			Noise = MRI_lmmse(Image,[7,7]);         
			[Width,Height] = size(Image);
			q1=100; %size of the crop box
			X_Start = floor((Width-q1)/2); % or round instead of floor; using neither gives warning
			X_Stop = X_Start + q1;
			Y_Start = floor((Height-q1)/2);
			Y_Stop = Y_Start + q1;
			Image100 = Image(X_Start:X_Stop, Y_Start:Y_Stop, :);       
			Signal = mean2(Image100);        
			SNRMetric = 10*log10(Signal / Noise);        
		
		otherwise
			SNRMetric = [];
			return 
	end


%------------- END OF CODE --------------
end        





























