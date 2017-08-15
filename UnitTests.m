% Unit Test for Step 2

Settings = LoadConfigVariables();
cd (Settings.ResultFolder);
load('2017-06-06_ASP_RegressionInput.mat')
% Unit test for RUSBoostClassifer.m
ClassifierModel = Step2ClassifiersTests(RegressionInput(:,1:65), RegressionInput(:,67));


lda = fitcdiscr(RegressionInput(:,1:65), RegressionInput(:,67), 'DiscrimType','pseudoLinear');

%load('2017-06-06_BDP_RegressionInput.mat')
%[Arg3, Arg4] = PrediValidate(RegressionInput(:,1:65),RegressionInput(:,67),ClassifierModel);
