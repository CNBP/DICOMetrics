function Output = SingleModelClassifier(SingleModel, metrics, trueLabelsVector, modelLabel)
% NAME - DESCRIPTION
%
% Syntax:  [output1,output2] = function_name(input1,input2,input3)
%
% Inputs:
%    	SingleModel 			 - Description
%    	metrics 			     - Description
%    	trueLabelsVector 	 - 0 is indicator for bad quality image. 1 is good quality label indicator
%
% Outputs:
%    	output1			- Description
%    	output2			- Description
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
% 2017; Last revision: 2017-09-15 13:01:40 Eastern Time

%------------- BEGIN CODE --------------

  Output = struct;

  % Read in the setting files
  Setting = LoadConfigVariables();

  % Save current path.
  currentDir = pwd;
  cd(Setting.ResultFolder);
  Dir = mkdirNowPrefix(['ClassifierModel-' modelLabel]);
  cd (Dir)

  Mdl = crossval(SingleModel);

  % 'Leaveout', 'on' ...
  % 'CrossVal', 'on' ...

  % this creaets a ClassificationPartitionedModel
  % that can only use KFoldPredict
  % Produce labels and scores necessary for the ConfusionMat and the ROC Curve.
  [predictedLabelVector, predictedScore] = kfoldPredict(Mdl);

  %Confusion
  [confusionMat,order] = confusionmat(trueLabelsVector,predictedLabelVector);

  % A note about confusionmat function,
  % Each Row: from top to bottom are TRUE CLASSES, from 1 TO 4, or 0 to 1
  % Each Column: from left to right are PREDICTED CLASSES: 1 TO 4 eg., or 0 to 1

  % Top Left: Bad images Being Classified as Bad.
  % Top Right: Bad images Being Classified as Good.    -> this is 1, 2: FalseNegative for image QC purposes.
  % Bottom Left: Good images Being Classified as Bad.  -> this is 2, 1 : FalsePositive for image QC purpose.
  % Bottom Right: Good images being classified as Good.

  %Keep in mind that PLOTCONFUSION in matlab does NOT give a fuck about this classification as they use two separate 2d vector to compute the overlaps.

  % A combination of both false positive and false negatives



%%% IMPORTANT TO UNDERSTAND THIS SECTION!!!!
  % So Coordinate (2,1) is interpreted as TRUE class 2 (Good Images) being Label as class 1 (Bad Images),
  % aka false positives when it comes to image QA (target class is 0), % False Negatives when it comes to GOOD image identification (target class is 1)
  CurrentFalsePositive = confusionMat(2,1); % Storing as false positives as these are for QA purposes!

  % So Coordinate (1,2) is interpreted as TRUE class 1 (Bad Images) being Label as class 2 (Good Images),
  % aka false negative when it comes to image QA (target class is 0), false POSITIVE when it comes to GOOD image identification (target class is 1)
  CurrentFalseNegative = confusionMat(1,2); % Storing as false negatives as these are for QA purposes!

  % Tabulate all mistakes together
  CurrentMistakes = CurrentFalseNegative + CurrentFalsePositive;

  % Compute and concatenate Binary PREDICTED Labels
  %GoodImagePredictedLabel= predictedLabelVector;
  %BadImagePredictedLabel = (predictedLabelVector+(-1)) * -1; % Convert the label to Binary style, for plotConfusion
  %predictedLabel = [BadImagePredictedLabel GoodImagePredictedLabel];
  predictedLabels = LabelConverter1Dto2D(predictedLabelVector);


  % Compute and concatenate Binary TRUE Labels
  %GoodImageTrueLabel= trueLabelsVector;
  %BadImageTrueLabel = (trueLabelsVector+(-1)) * -1; % Convert the labe to Binary style, for plotConfusion
  %trueLabels = [BadImageTrueLabel GoodImageTrueLabel];
  trueLabels = LabelConverter1Dto2D(trueLabelsVector);


  % Note that predicted Label and Truel Labels are 0: bad image, 1: good images where as class number-wise, they are 1 then 2.

  figure('Visible','off');
  filenameConfusion = strcat('Confusion-',string(modelLabel),'-modelLabel','.fig');
  filenameROCPoint = strcat('ROCPoint-',string(modelLabel),'.fig');
  filenameROC = strcat('ROC-',string(modelLabel),'.fig');

  % True Label vs PredictedScore for bad images in the first column, true class is 0 (bad images)
  [X,Y,Threshold,AreaUnderCurve] = perfcurve(trueLabelsVector,predictedScore(:,1),0);

  % Plot ROC curve
  plot(X,Y);
  xlabel('False positive rate');
  ylabel('True positive rate');
  title(['ROC for Classification by ' string(modelLabel)]);
  %legend('Bad Images','Good Images');
  saveas(gcf,char(filenameROC),'fig');

  % Plot confusion, class in row, column represent observations.Must use their binary form.
  plotconfusion(trueLabels',predictedLabels');

  xlabel('Truth')
  ylabel('Inferred')
  set(gca,'xticklabel',{'True Bad' 'True Good' 'Total Predicted'})
  set(gca,'yticklabel',{'Predicted Bad' 'Predicted Good' 'Total True'})
  saveas(gcf,char(filenameConfusion),'fig');

  % Plot the ROC characterics
  plotroc(trueLabels',predictedLabels');
  saveas(gcf,char(filenameROCPoint),'fig');

  %openfig('Confusion.fig','new','visible')
  %openfig('ROC.fig','new','visible')
  %Update essential exported values.
  Output.model          = SingleModel;
  Output.CVmodel        = Mdl;
  Output.confusion      = filenameConfusion;
  Output.ROCPoint       = filenameROCPoint;
  Output.ROC            = filenameROC;
  Output.ROCThreshold   = Threshold;
  Output.ROCAUC         = AreaUnderCurve;
  Output.predictedLabel = predictedLabelVector;
  Output.Mistakes       = CurrentMistakes;
  Output.FalseNegative  = CurrentFalseNegative;
  Output.FalsePositive  = CurrentFalsePositive;
  Output.confusionMat   = confusionMat;
  Output.time           = datetime('now','format','yyyy-MM-dd_HH-mm-ss');

  % Save the model somewhere for inspection and thorough evaluations.
  save ([modelLabel,'.mat'],'Output');

  %Require Fig converter at https://www.mathworks.com/matlabcentral/fileexchange/16906-convert-fig-files-to-images
  % Convert all figs. into JPG files.
  export_figs('jpg');

  % Return where we come from.
  cd(currentDir);
  figure('Visible','on');
%------------- END OF CODE --------------
end
