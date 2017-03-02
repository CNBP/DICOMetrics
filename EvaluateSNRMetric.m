function Metric = EvaluateSNRMetric(Image,Number)
%This function loads a regular image try to parse it properly to the format and then send it to a bunch of image processing facility. 
% ImageInBuffer = imread(InputImage);
% InputRGBImageDouble = im2double(ImageInBuffer);
% %Image = rgb2gray(InputRGBImageDouble);
% Image = InputRGBImageDouble;

%Image data was benched in  
% OS Name	Microsoft Windows 10 Home
% Version	10.0.14393 Build 14393
% Other OS Description 	Not Available
% OS Manufacturer	Microsoft Corporation
% System Name	DESKTOP-ICES9FH
% System Manufacturer	Hewlett-Packard
% System Model	HP SPECTRE X360 CONVERTIBLE
% System Type	x64-based PC
% System SKU	N5R94UA#ABA
% Processor	Intel(R) Core(TM) i7-5500U CPU @ 2.40GHz, 2401 Mhz, 2 Core(s), 4 Logical Processor(s)
% BIOS Version/Date	American Megatrends Inc. F.43, 2016-09-28
% SMBIOS Version	2.8
% Embedded Controller Version	58.98
% BIOS Mode	UEFI
% BaseBoard Manufacturer	Hewlett-Packard
% BaseBoard Model	Not Available
% BaseBoard Name	Base Board
% Platform Role	Mobile
% Secure Boot State	Off
% PCR7 Configuration	Elevation Required to View
% Windows Directory	C:\WINDOWS
% System Directory	C:\WINDOWS\system32
% Boot Device	\Device\HarddiskVolume1
% Locale	Canada
% Hardware Abstraction Layer	Version = "10.0.14393.206"
% User Name	DESKTOP-ICES9FH\dyt81
% Time Zone	Eastern Standard Time
% Installed Physical Memory (RAM)	8.00 GB
% Total Physical Memory	7.91 GB
% Available Physical Memory	1.77 GB
% Total Virtual Memory	11.4 GB
% Available Virtual Memory	1.76 GB
% Page File Space	3.49 GB
% Page File	C:\pagefile.sys
% Hyper-V - VM Monitor Mode Extensions	Yes
% Hyper-V - Second Level Address Translation Extensions	Yes
% Hyper-V - Virtualization Enabled in Firmware	Yes
% Hyper-V - Data Execution Protection	Yes 

if(~isnumeric(Number))
    Metric = [];
    return
end 
    
BinNumber = 1000; %Number of Histogram Bins Recommended by Author.

switch Number
    case 1
		Metric = AjaNE(Image,7,BinNumber,1); %Elapsed time is 0.015575 seconds.;
    
    case 2
		Metric = AjaNE(Image,7,BinNumber,2); %Elapsed time is 0.108896 seconds.;
          
    case 3 
		Metric = AjaNE(Image,7,BinNumber,3); %Elapsed time is 0.168390 seconds.;
           
    case 4 
		Metric = AjaNE(Image,7,BinNumber,4); %Elapsed time is 1.066069 seconds.;
           
    case 5 
		Metric = brummer(Image,BinNumber); %Elapsed time is 0.098980 seconds.;
           
    case 6 
		Metric = chang(Image,7); %Elapsed time is 0.369968 seconds.;
           
    case 7
		Metric= noise_M1(Image,7,BinNumber); %Elapsed time is 0.043884 seconds.;
    
    case 8
		Metric= noise_M2(Image,7,BinNumber);%Elapsed time is 0.136574 seconds.;
    
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





























