function [predictedLabelVector predictedScore] = PrediValidate(validationMetrics, trueLabelsVector, inputClassifierModel)
  % OutputLabels - In addition to predict the label and score, also save it by compare against the true label and give a confus
  %
  % Syntax:  OutputLabels = RUSBoostClassifier(validationMetrics,trueLabels)
  %
  % Inputs:
  %    	validationMetrics 			- validationMetrics per subject, observations in rows, validationMetrics arranged in columns.
  %    	trueLabels 		- X by 1 vector labeling the subjects.
  %     inputClassifierModel         - the previously computed inputClassifierModel
  % Outputs:
  %    	PredictedLabel - X by 1 vector labeling the subjects based on the inputClassifierModel.
  %
  % Other m-files required: 		none
  % Subfunctions: 				      none
  % Toolbox required: 			    export_figs
  %

  % Author: Yang Ding
  % All works sponsored by Dr. Gregory Lodygensky and the Canadian Neonatal Brain Platform
  % Saint. Justine Hospital, Montreal, Quebec,
  % email address: it@cnbp.ca
  % Website: http://cnbp.ca
  % 2017-07; Last revision: 2017-08-09 23:08:01 Eastern Time

  %------------- BEGIN CODE --------------
  Settings = LoadConfigVariables();

  %=======BEGIN Rejection Area
  %RUSBoost Predictions.
  OutputLabels = [];

  % Check if validationMetrics and labels have the same rows.
  if (isempty(validationMetrics) || isempty(trueLabelsVector) || isempty(inputClassifierModel))
    error('Fatal Error:Input EMPTY!');
    return;
  elseif (size(validationMetrics,1) ~= size(trueLabelsVector,1))
    error('Fatal Error:Input rows do not match and cannot process. Make sure labels and validationMetrics have the SAME number of rows!');
    return;
  elseif (size(trueLabelsVector,2) == 2)
    error('Fatal Error:Input trueLabels must only have two classes!');
    return;
  elseif (size(validationMetrics,2) ~= size(inputClassifierModel.model.X,2))
    error('Fatal Error:Input model and input metric do not match in terms of validationMetrics and cannot process. Make sure validationMetrics have the SAME number of COLUMNS!');
    return;
  end

  % Generate output based on prediction.
  [predictedLabelVector,predictedScore] = SingleModelPredictor(validationMetrics, inputClassifierModel.model);


  if (isempty(predictedLabelVector) ||isempty(predictedScore)); return; end; %Reject empty output.


  [confusionMat,order] = confusionmat(trueLabelsVector,predictedLabelVector);

  % A note about confusionmat function,
  % Left top to bottom are TRUE CLASSES: 1 TO 4
  % Bottom Left to Right are PREDICTED CLASSES: 1 TO 4 eg.
  % A combination of both false positive and false negatives

  % So Coordinate (2,1) is interpreted as TRUE class 1 (Bad Images) being Label as class 2 (Clear Images), aka false negative when it comes to image QA
  CurrentFalseNegative = confusionMat(2,1); % False Negatives

  % So Coordinate (1,2) is interpreted as TRUE class 2 (Good Images) being Label as class 1 (Bad Images), aka false positive when it comes to image QA
  CurrentFalsePositive = confusionMat(1,2); % Flase Positives

  % Tabulate all mistakes together
  CurrentMistakes = CurrentFalseNegative + CurrentFalsePositive;

  % Compute and concatenate Binary PREDICTED Labels
  GoodImagePredictedLabel= predictedLabelVector;
  BadImagePredictedLabel = (predictedLabelVector+(-1)) * -1; % Convert the label to Binary style, for plotConfusion
  predictedLabel = [BadImagePredictedLabel GoodImagePredictedLabel];

  % Compute and concatenate Binary TRUE Labels
  GoodImageTrueLabel= trueLabelsVector;
  BadImageTrueLabel = (trueLabelsVector+(-1)) * -1; % Convert the labe to Binary style, for plotConfusion
  trueLabels = [BadImageTrueLabel GoodImageTrueLabel];

  % Retrieve Fold and COST information.
  cost = inputClassifierModel.cost;
  fold = inputClassifierModel.fold

  % Note that predicted Label and Truel Labels are 0: bad image, 1: good images where as class number-wise, they are 1 then 2.

  figure('Visible','on');

  filenameConfusion = strcat('External Data Validated Confusion_Fold for ', ...
                      string(var2str(inputClassifierModel)),string(fold),'-Cost',string(cost),'.fig');
  filenameROCPoint  = strcat('External Data Validated ROCPoint_Fold ',...
                      string(var2str(inputClassifierModel)),string(fold),'-Cost',string(cost),'.fig');
  filenameROC       = strcat('External Data Validated ROC_Fold ',...
                      string(var2str(inputClassifierModel)),string(fold),'-Cost',string(cost),'.fig');

  % True Label vs PredictedScore for bad images in the first column, true class is 0 (bad images)
  [X,Y,Threshold,AreaUnderCurve] = perfcurve(trueLabelsVector,predictedScore(:,1),0);

  currentDir = pwd;
  cd(Settings.Folder.Result)
  %Generate new directory for today's data.
  NowDirectory = mkdirNowPrefix('PrediValidate');
  cd (NowDirectory);

  % Plot ROC curve
  plot(X,Y);
  xlabel('False positive rate');
  ylabel('True positive rate');
  title(strcat('ROC for Classification by ROSBoost with False Negative Cost of',string(cost)));

  %legend('Bad Images','Good Images');
  saveas(gcf,char(filenameROC),'fig');

  % Plot confusion, class in row, column represent observations.Must use their binary form.
  plotconfusion(trueLabels',predictedLabel');

  xlabel('Truth')
  ylabel('Inferred')
  set(gca,'xticklabel',{'True Bad' 'True Good' 'Total Predicted'})
  set(gca,'yticklabel',{'Predicted Bad' 'Predicted Good' 'Total True'})
  saveas(gcf,char(filenameConfusion),'fig');

  % Plot the ROC characterics
  plotroc(trueLabels',predictedLabel');
  saveas(gcf,char(filenameROCPoint),'fig');

  export_figs('jpg');

  cd(currentDir);
  %------------- END OF CODE --------------
end
