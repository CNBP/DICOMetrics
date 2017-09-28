% Unit Test for Step 1
clc;
clear;
% Get Main path;
path                  = uigetdir;

% Step1: Use path to derive metrics;
Metrics               = Step1ExtractMetrics(path,'ASP');





% Unit Test for Step 2
clc;
clear;
Settings = LoadConfigVariables();
cd (Settings.Folder.Result);

% Load LabelBinary
load('2017-06-06_Label_BDP_ANN_Binary.mat');

% Load MetricsMatrix
load('C:\Users\dyt81\Documents\GitHub\QCMetrics\Results\MetricsComputation-2017-09-11_175719\MetricsMatrix.mat');
cd ..
% Unit test for RUSBoostClassifier.m
ClassifierModel = Step2ClassifiersTests(MetricsMatrix, LabelBinary(:,2));

%load('2017-06-06_BDP_RegressionInput.mat')
%[Arg3, Arg4] = PrediValidate(RegressionInput(:,1:65),RegressionInput(:,67),ClassifierModel);





% Unit Test for Step 2
clc;
clear;
Settings = LoadConfigVariables();
cd (Settings.Folder.Result);

% Load LabelBinary
load('2017-06-06_Label_ASP_ANN_Binary.mat');

% Load MetricsMatrix
load('C:\Users\dyt81\Documents\GitHub\QCMetrics\Results\MetricsComputation-2017-09-18_005020\MetricsMatrix.mat');
cd ..
% Unit test for RUSBoostClassifier.m
ClassifierModel = Step2ClassifiersTests(MetricsMatrix, LabelBinary(:,2));

%load('2017-06-06_BDP_RegressionInput.mat')
%[Arg3, Arg4] = PrediValidate(RegressionInput(:,1:65),RegressionInput(:,67),ClassifierModel);
