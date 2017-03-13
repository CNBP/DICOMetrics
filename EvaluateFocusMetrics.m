function FocusMetric = EvaluateAllFocusFocusMetric(Image, AlgoChoice)
%FocusMetric - One line description of what the function or script performs (H1 line)
%
% Syntax:  [output1,output2] = function_name(input1,input2,input3)
%
% Inputs:
%    	Image 			- this is the grayscale level image has been passed to be processed and summarized
%    	AlgoChoice		- a number indicate which algorithm to be used
%			
% Outputs:			
%    	Metric			- metric is the single summary of focus metric calculated based on algorithm of choice
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
% 2017-03; Last revision: 10:26 AM 2017-03-02

%------------- BEGIN CODE --------------
addpath(genpath('Dependency_FocusFocusMetrics'));


if(~isnumeric(AlgoChoice))
    Metric = [];
    return
end 

switch AlgoChoice
case 1;
	FocusMetric = FocusMeasure(Image, 'ACMO') %Elapsed time is 0.015575 seconds.
case 2         
	FocusMetric = FocusMeasure(Image, 'BREN') %Elapsed time is 0.108896 seconds.
case 3         
	FocusMetric = FocusMeasure(Image, 'CONT') %Elapsed time is 22.416007 seconds.
case 4         
	FocusMetric = FocusMeasure(Image, 'CURV') %Elapsed time is 0.168390 seconds.
case 5         
	FocusMetric = FocusMeasure(Image, 'DCTE') %Elapsed time is 329.292912 seconds.
case 6         
	FocusMetric = FocusMeasure(Image, 'DCTR') %Elapsed time is 371.556517 seconds.
case 7         
	FocusMetric = FocusMeasure(Image, 'GDER') %Elapsed time is 1.066069 seconds.
case 8         
	FocusMetric = FocusMeasure(Image, 'GLVA') %Elapsed time is 0.098980 seconds.
case 9         
	FocusMetric = FocusMeasure(Image, 'GLLV') %Elapsed time is 0.369968 seconds.
case 10        
	FocusMetric = FocusMeasure(Image, 'GLVN') %Elapsed time is 0.043884 seconds.
case 11        
	FocusMetric = FocusMeasure(Image, 'GRAE') %Elapsed time is 0.136574 seconds.
case 12        
	FocusMetric = FocusMeasure(Image, 'GRAT') %Elapsed time is 0.183992 seconds.
case 13        
	FocusMetric = FocusMeasure(Image, 'GRAS') %Elapsed time is 0.042493 seconds.
case 14        
	FocusMetric = FocusMeasure(Image, 'HELM') %Elapsed time is 0.412047 seconds.
case 15        
	FocusMetric = FocusMeasure(Image, 'HISE') %Elapsed time is 0.053616 seconds.
case 16        
	FocusMetric = FocusMeasure(Image, 'HISR') %Elapsed time is 0.012549 seconds.
case 17        
	FocusMetric = FocusMeasure(Image, 'LAPE') %Elapsed time is 0.107152 seconds.
case 18        
	FocusMetric = FocusMeasure(Image, 'LAPM') %Elapsed time is 0.189061 seconds.
case 19        
	FocusMetric = FocusMeasure(Image, 'LAPV') %Elapsed time is 0.078275 seconds.
case 20        
	FocusMetric = FocusMeasure(Image, 'LAPD') %Elapsed time is 0.199228 seconds.
case 21        
	FocusMetric = FocusMeasure(Image, 'SFIL') %Elapsed time is 0.886643 seconds.
case 22        
	FocusMetric = FocusMeasure(Image, 'SFRQ') %Elapsed time is 0.142359 seconds.
case 23        
	FocusMetric = FocusMeasure(Image, 'TENG') %Elapsed time is 0.139687 seconds.
case 24        
	FocusMetric = FocusMeasure(Image, 'TENV') %Elapsed time is 0.175562 seconds.
case 25        
	FocusMetric = FocusMeasure(Image, 'VOLA') %Elapsed time is 0.126499 seconds.
case 26        
	FocusMetric = FocusMeasure(Image, 'WAVS') %Elapsed time is 1.174368 seconds.
case 27        
	FocusMetric = FocusMeasure(Image, 'WAVV') %Elapsed time is 0.854845 seconds.
case 28        
	FocusMetric = FocusMeasure(Image, 'WAVR') %Elapsed time is 1.553048 seconds

end        
%------------- END OF CODE --------------