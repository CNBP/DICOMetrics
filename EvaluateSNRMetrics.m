function Metric = EvaluateSNRMetric(Image,AlgoChoice)
%This function loads a regular image try to parse it properly to the format and then send it to a bunch of image processing facility. 
% ImageInBuffer = imread(InputImage);
% InputRGBImageDouble = im2double(ImageInBuffer);
% %Image = rgb2gray(InputRGBImageDouble);
% Image = InputRGBImageDouble;


%Get current path. 
scriptName = mfilename('fullpath');
[currentpath, filename, fileextension]= fileparts(scriptName);

% Ensure dependencies are properly referred to
addpath(genpath('Dependency_SNRMetrics'));
addpath(genpath('Dependency_SNRMetrics/localstat'));


if(~isnumeric(AlgoChoice))
    Metric = [];
    return
end 
    
BinNumber = 1000; %AlgoChoice of Histogram Bins Recommended by Author.

switch AlgoChoice
    case 1
		Metric = AjaNE(Image,7,BinNumber,1); 
    
    case 2
		Metric = AjaNE(Image,7,BinNumber,2); 
          
    case 3 
		Metric = AjaNE(Image,7,BinNumber,3); 
           
    case 4 
		Metric = AjaNE(Image,7,BinNumber,4); 
           
    case 5 
		Metric = brummer(Image,BinNumber); 
           
    case 6 
		Metric = chang(Image,7); 
           
    case 7
		Metric= noise_M1(Image,7,BinNumber);
    
    case 8
		Metric= noise_M2(Image,7,BinNumber);
    
    case 9
        Metric = MRI_lmmse(Image,[7,7]); 
    
    case 10 
        Metric = mean2(Image);
    
    case 11
        [Width,Height] = size(Image);
        q1=50; %size of the crop box
        X_Start = floor((Width-q1)/2); % or round instead of floor; using neither gives warning
        X_Stop = X_Start + q1;
        Y_Start = floor((Height-q1)/2);
        Y_Stop = Y_Start + q1;
        Image50 = Image(X_Start:X_Stop, Y_Start:Y_Stop, :);        
        Metric = mean2(Image50);
        
    case 12
        [Width,Height] = size(Image);
        q1=100; %size of the crop box
        X_Start = floor((Width-q1)/2); % or round instead of floor; using neither gives warning
        X_Stop = X_Start + q1;
        Y_Start = floor((Height-q1)/2);
        Y_Stop = Y_Start + q1;
        Image100 = Image(X_Start:X_Stop, Y_Start:Y_Stop, :);       
        Metric = mean2(Image100);
    
    case 13 % Total Image SNR
        Noise = MRI_lmmse(Image,[7,7]);          
        Signal = mean2(Image);        
        Metric =  10*log10(Signal / Noise);
    
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
        Metric = 10*log10(Signal / Noise);
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
        Metric = 10*log10(Signal / Noise);        
    otherwise
        Metric = [];
		return 
end


end        





























