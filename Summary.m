Raw = dicomread('Example.dcm');
Dbl = im2double(Raw);


[Width,Height] = size(Raw);
q1=50; %size of the crop box
X_Start = floor((Width-q1)/2); % or round instead of floor; using neither gives warning
X_Stop = X_Start + q1;
Y_Start = floor((Height-q1)/2);
Y_Stop = Y_Start + q1;
Dbl50 = Dbl(X_Start:X_Stop, Y_Start:Y_Stop, :);

[Width,Height] = size(Raw);
q1=100; %size of the crop box
X_Start = floor((Width-q1)/2); % or round instead of floor; using neither gives warning
X_Stop = X_Start + q1;
Y_Start = floor((Height-q1)/2);
Y_Stop = Y_Start + q1;
Dbl100 = Dbl(X_Start:X_Stop, Y_Start:Y_Stop, :);


BinNumber = 1000; %Number of Histogram Bins Recommended by Author.

Result1 = AjaNE(Dbl,7,BinNumber,1);
Result2 = AjaNE(Dbl,7,BinNumber,2);
Result3 = AjaNE(Dbl,7,BinNumber,3);
Result4 = AjaNE(Dbl,7,BinNumber,4);
Result5 = brummer(Dbl,BinNumber);
Result6 = chang(Dbl,7);
Result7 = noise_M1(Dbl,7,BinNumber);
Result8 = noise_M2(Dbl,7,BinNumber);
Result9 = MRI_lmmse(Dbl,[7,7]); 

Signal = mean2(Dbl);
Signal50 = mean2(Dbl50);
Signal100 = mean2(Dbl100);
SNR = 10*log10(Signal / Result9);
SNR1 = 10*log10(Signal50 / Result9);
SNR2 = 10*log10(Signal100 / Result9);

