%Some Code mainly used during unit test of the RUSBoostClassifier function.

for model = 1:3
  Settings = LoadConfigVariables();
  cd (Settings.ResultFolder);
  load('2017-06-06_ASP_RegressionInput.mat')
  % Unit test for RUSBoostClassifer.m
  ClassifierModel = RUSBoostClassifier(RegressionInput(:,1:65), RegressionInput(:,67),99, model);
  load('2017-06-06_BDP_RegressionInput.mat')
  [Arg3, Arg4] = PrediValidate(RegressionInput(:,1:65),RegressionInput(:,67),ClassifierModel);
end






(size(RegressionInput(:,1:65),1) ~= size(RegressionInput(:,67),1))



trueLabelsVector = RegressionInput(:,67);
metrics = RegressionInput(:,1:65);
fold = 10;
cost = 15;
