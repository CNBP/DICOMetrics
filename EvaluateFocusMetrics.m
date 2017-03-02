function FM = EvaluateAllFocusMetric(Image)
%This function loads a regular image try to parse it properly to the format and then send it to a bunch of image processing facility. 
% ImageInBuffer = imread(InputImage);
% InputRGBImageDouble = im2double(ImageInBuffer);
% %Image = rgb2gray(InputRGBImageDouble);
% Image = InputRGBImageDouble;

% Ensure dependencies are properly referred to
addpath(genpath('Dependency_FocusMetrics'));

FM = zeros(28,1);
FM( 1)= FocusMeasure(Image, 'ACMO') %Elapsed time is 0.015575 seconds.;
FM( 2)= FocusMeasure(Image, 'BREN') %Elapsed time is 0.108896 seconds.;
%FM( 3)= FocusMeasure(Image, 'CONT') %Elapsed time is 22.416007 seconds.;
FM( 4)= FocusMeasure(Image, 'CURV') %Elapsed time is 0.168390 seconds.;
%FM( 5)= FocusMeasure(Image, 'DCTE') %Elapsed time is 329.292912 seconds.;
%FM( 6)= FocusMeasure(Image, 'DCTR') %Elapsed time is 371.556517 seconds.;
FM( 7)= FocusMeasure(Image, 'GDER') %Elapsed time is 1.066069 seconds.;
FM( 8)= FocusMeasure(Image, 'GLVA') %Elapsed time is 0.098980 seconds.;
FM( 9)= FocusMeasure(Image, 'GLLV') %Elapsed time is 0.369968 seconds.;
FM(10)= FocusMeasure(Image, 'GLVN') %Elapsed time is 0.043884 seconds.;
FM(11)= FocusMeasure(Image, 'GRAE') %Elapsed time is 0.136574 seconds.;
FM(12)= FocusMeasure(Image, 'GRAT') %Elapsed time is 0.183992 seconds.;
FM(13)= FocusMeasure(Image, 'GRAS') %Elapsed time is 0.042493 seconds.;
FM(14)= FocusMeasure(Image, 'HELM') %Elapsed time is 0.412047 seconds.;
FM(15)= FocusMeasure(Image, 'HISE') %Elapsed time is 0.053616 seconds.;
FM(16)= FocusMeasure(Image, 'HISR') %Elapsed time is 0.012549 seconds.;
FM(17)= FocusMeasure(Image, 'LAPE') %Elapsed time is 0.107152 seconds.;
FM(18)= FocusMeasure(Image, 'LAPM') %Elapsed time is 0.189061 seconds.;
FM(19)= FocusMeasure(Image, 'LAPV') %Elapsed time is 0.078275 seconds.;
FM(20)= FocusMeasure(Image, 'LAPD') %Elapsed time is 0.199228 seconds.;
FM(21)= FocusMeasure(Image, 'SFIL') %Elapsed time is 0.886643 seconds.;
FM(22)= FocusMeasure(Image, 'SFRQ') %Elapsed time is 0.142359 seconds.;
FM(23)= FocusMeasure(Image, 'TENG') %Elapsed time is 0.139687 seconds.;
FM(24)= FocusMeasure(Image, 'TENV') %Elapsed time is 0.175562 seconds.;
FM(25)= FocusMeasure(Image, 'VOLA') %Elapsed time is 0.126499 seconds.;
FM(26)= FocusMeasure(Image, 'WAVS') %Elapsed time is 1.174368 seconds.;
FM(27)= FocusMeasure(Image, 'WAVV') %Elapsed time is 0.854845 seconds.;
FM(28)= FocusMeasure(Image, 'WAVR') %Elapsed time is 1.553048 seconds.;

end        





























