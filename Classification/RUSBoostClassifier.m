function ClassifierModel = RUSBoostClassifier(metrics, trueLabelsVector, DefaultMistakeThreshold)
%ClassifierModel - Return an array containing all RUSBoosted classifiers at various weight and tree counts.
%
% Syntax:  ClassifierModel = RUSBoostClassifier(metrics,trueLabels)
%
% Inputs:
%    	metrics 			- metrics per subject, observations in rows, metrics arranged in columns.
%    	trueLabels 		- X by 1 vector labeling the subjects.
%
% Outputs:
%    	PredictedLabel - X by 1 vector labeling the subjects based on the model.
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
% 2017-07; Last revision: 2017-08-22 10:00:56 Eastern Time

%------------- BEGIN CODE --------------

  Settings = LoadConfigVariables();

  % Check if metrics and labels have the same rows.
  if (isempty(metrics) || isempty(trueLabelsVector) || isempty(DefaultMistakeThreshold))
    error('Fatal Error:Input EMPTY!');
    return;
  elseif (size(metrics,1) ~= size(trueLabelsVector,1))
    error('Fatal Error:Input rows do not match and cannot process. Make sure labels and metrics have the SAME number of rows!');
    return;
  elseif (size(trueLabelsVector,2) == 2)
    error('Fatal Error:Input trueLabels must only have two classes!');
    return;
  elseif ~isfinite(DefaultMistakeThreshold)
    error('Fatal Error: mistake/bias threshold not valid!');
    return; %Return if the default mistake is not a number.
  end

  %Initialization block
  % DefaultMistakeThreshold                       = 99;
  OverallModel.FalsePositive           = DefaultMistakeThreshold;
  OverallModel.FalseNegative           = DefaultMistakeThreshold;
  OverallModel.Mistakes                = DefaultMistakeThreshold;

  FalseNegativeBiasModel.FalsePositive = DefaultMistakeThreshold;
  FalseNegativeBiasModel.FalseNegative = DefaultMistakeThreshold;
  FalseNegativeBiasModel.Mistakes      = DefaultMistakeThreshold;

  FalsePositiveBiasModel.FalsePositive = DefaultMistakeThreshold;
  FalsePositiveBiasModel.FalseNegative = DefaultMistakeThreshold;
  FalsePositiveBiasModel.Mistakes      = DefaultMistakeThreshold;

  CurrentFalsePositive                 = DefaultMistakeThreshold;
  CurrentFalseNegative                 = DefaultMistakeThreshold;
  CurrentMistakes                      = DefaultMistakeThreshold;

  currentDir = pwd;

  cd(Settings.Folder.Result)

  %Generate new directory for today's data.
  NowDirectory = mkdirNowPrefix(['ClassifierModel-RUSBoostClassifier']);
  cd (NowDirectory);

  %Begin ensemble classifier
  for fold = [10 100] %10000 fold has no gain.
    for cost = [5 10 11 12 13 14 15 16]

      %Make an emsembled tree. with 10K learning cycle, using RUSBoost, and penalize incorrect Class0 (worst image) weight X times more than regular images after Y fold cross validation
      SingleModel = fitcensemble( ...
      metrics, trueLabelsVector, ...
      'NumLearningCycles',fold, ...
      'Method','RUSBoost', ...
      'Learners','tree', ...
      'cost', [0 1; cost 0] ...
      );

      Mdl = crossval(SingleModel);

      % 'Leaveout', 'on' ...
      % 'CrossVal', 'on' ...

      % this creaets a ClassificationPartitionedModel
      % that can only use KFoldPredict
      % Produce labels and scores necessary for the ConfusionMat and the ROC Curve.
      [predictedLabelVector,predictedScore] = kfoldPredict(Mdl);

      %Confusion
      [confusionMat,order] = confusionmat(trueLabelsVector,predictedLabelVector);

      % A note about confusionmat function,
      % Left top to bottom are TRUE CLASSES: 1 TO 4
      % Bottom Left to Right are PREDICTED CLASSES: 1 TO 4 eg.
      % A combination of both false positive and false negatives

      %%% IMPORTANT TO UNDERSTAND THIS SECTION!!!!
      % So Coordinate (2,1) is interpreted as non-target class (Good Images) being Label as target class (Bad Images),
      % aka false positives when it comes to image QA (target class is bad image),
      CurrentFalseNegative = confusionMat(2,1); % Storing as false positives as these are for QA purposes!
      % Order = 0, 1 or good image then bad image, an index of 2, 1 means it is bad image labelled good or false negative. .
      %Observe in bad but is predicted good.

      % So Coordinate (1,2) is interpreted as target class 1 (Bad Images) being Label as non-target classs (Good Images),
      % aka false negative when it comes to image QA (target class is bad image)
      CurrentFalsePositive = confusionMat(1,2); % Storing as false negatives as these are for QA purposes!
      % Order = 0, 1 or good image then bad image, an index of 2, 1 means it is bad image labelled good or false negative. .
      %Observe in bad but is predicted good.

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
      filenameConfusion = strcat('Confusion_Fold',string(fold),'-Cost',string(cost),'.fig');
      filenameROCPoint = strcat('ROCPoint_Fold',string(fold),'-Cost',string(cost),'.fig');
      filenameROC = strcat('ROC_Fold',string(fold),'-Cost',string(cost),'.fig');

      % True Label vs PredictedScore for bad images in the first column, true class is 0 (bad images)
      [X,Y,Threshold,AreaUnderCurve] = perfcurve(trueLabelsVector,predictedScore(:,1),0);

      % Plot ROC curve
      plot(X,Y);
      xlabel('False positive rate');
      ylabel('True positive rate');
      title(strcat('ROC for Classification by ROSBoost with False Negative Cost of',string(cost)));
      %legend('Bad Images','Good Images');
      saveas(gcf,char(filenameROC),'fig');

      % Plot confusion, class in row, column represent observations. Must use their binary form.
      plotconfusion(trueLabels',predictedLabels');

      xlabel('Truth')
      ylabel('Inferred')
      set(gca,'xticklabel',{'True Good(NT)' 'True Bad(T)' 'Total Predicted'})
      set(gca,'yticklabel',{'Predicted Good(NT)' 'Predicted (T)' 'Total True'})
      saveas(gcf,char(filenameConfusion),'fig');

      % Plot the ROC characterics
      plotroc(trueLabels',predictedLabels');
      saveas(gcf,char(filenameROCPoint),'fig');

      %openfig('Confusion.fig','new','visible')
      %openfig('ROC.fig','new','visible')


      % Threshold cut off
      if CurrentMistakes < DefaultMistakeThreshold

        % Store best overall model data.
        if (CurrentMistakes < OverallModel.Mistakes) || ... % prefer smaller number of overall errors.
           (CurrentMistakes == OverallModel.Mistakes && ... % if same number of total errors
          CurrentFalseNegative< OverallModel.FalseNegative) % check for smaller than the earlier false negatives

          %Update essential exported values.
          OverallModel.model          = SingleModel;
          OverallModel.CVmodel        = Mdl;
          OverallModel.confusion      = filenameConfusion;
          OverallModel.ROCPoint       = filenameROCPoint;
          OverallModel.ROC            = filenameROC;
          OverallModel.ROCThreshold   = Threshold;
          OverallModel.ROCAUC         = AreaUnderCurve;
          OverallModel.predictedLabel = predictedLabelVector;
          OverallModel.Mistakes       = CurrentMistakes;
          OverallModel.FalseNegative  = CurrentFalseNegative;
          OverallModel.FalsePositive  = CurrentFalsePositive;
          OverallModel.confusionMat   = confusionMat;
          OverallModel.fold           = fold;
          OverallModel.cost           = cost;
          OverallModel.time           = datetime('now','format','yyyy-MM-dd_HH-mm-ss');
        end

        % Store FalseNegativeBias model data.
        if (CurrentFalseNegative < FalseNegativeBiasModel.FalseNegative) || ...  % check for smaller than the earlier false negatives
          (CurrentFalseNegative == FalseNegativeBiasModel.FalseNegative && ... % if the same, check for smaller than earlier false positive to minimize overall error
           CurrentFalsePositive < FalseNegativeBiasModel.FalsePositive) % if still the same, then always prefer the EARLIER (with SMALLER tree hence not <= here.)

            %Update essential exported values.
            FalseNegativeBiasModel.model          = SingleModel;
            FalseNegativeBiasModel.CVmodel        = Mdl;
            FalseNegativeBiasModel.confusion      = filenameConfusion;
            FalseNegativeBiasModel.ROCPoint       = filenameROCPoint;
            FalseNegativeBiasModel.ROC            = filenameROC;
            FalseNegativeBiasModel.ROCThreshold   = Threshold;
            FalseNegativeBiasModel.ROCAUC         = AreaUnderCurve;
            FalseNegativeBiasModel.predictedLabel = predictedLabelVector;
            FalseNegativeBiasModel.Mistakes       = CurrentMistakes;
            FalseNegativeBiasModel.FalseNegative  = CurrentFalseNegative;
            FalseNegativeBiasModel.FalsePositive  = CurrentFalsePositive;
            FalseNegativeBiasModel.confusionMat   = confusionMat;
            FalseNegativeBiasModel.fold           = fold;
            FalseNegativeBiasModel.cost           = cost;
            FalseNegativeBiasModel.time           = datetime('now','format','yyyy-MM-dd_HH-mm-ss');
        end

        % Store FalsePositiveBias model data.
        if (CurrentFalsePositive < FalsePositiveBiasModel.FalsePositive) || ...% check for smaller than the earlier false positive
           (CurrentFalsePositive == FalsePositiveBiasModel.FalsePositive && ... % if the same, check for smaller than earlier false negative to minimize overall error
           CurrentFalseNegative < FalsePositiveBiasModel.FalseNegative) % if still the same, then always prefer the EARLIER (with SMALLER tree hence not <= here.)

            %Update essential exported values.
            FalsePositiveBiasModel.model          = SingleModel;
            FalsePositiveBiasModel.CVmodel        = Mdl;
            FalsePositiveBiasModel.confusion      = filenameConfusion;
            FalsePositiveBiasModel.ROCPoint       = filenameROCPoint;
            FalsePositiveBiasModel.ROC            = filenameROC;
            FalsePositiveBiasModel.ROCThreshold   = Threshold;
            FalsePositiveBiasModel.ROCAUC         = AreaUnderCurve;
            FalsePositiveBiasModel.predictedLabel = predictedLabelVector;
            FalsePositiveBiasModel.Mistakes       = CurrentMistakes;
            FalsePositiveBiasModel.FalseNegative  = CurrentFalseNegative;
            FalsePositiveBiasModel.FalsePositive  = CurrentFalsePositive;
            FalsePositiveBiasModel.confusionMat   = confusionMat;
            FalsePositiveBiasModel.fold           = fold;
            FalsePositiveBiasModel.cost           = cost;
            FalsePositiveBiasModel.time           = datetime('now','format','yyyy-MM-dd_HH-mm-ss');
        end
      end
    end
  end

  disp('Crossvalidated results show that: ')
  ClassifierModel = OverallModel;
  save ('OverallModel.mat','OverallModel');
  disp(strcat('The best overall model is for fold ',string(OverallModel.fold), ' and cost at ', string(OverallModel.cost)));


  save ('FalsePositiveBiasModel.mat','FalsePositiveBiasModel');
  disp(strcat('The best model optimizing for minimal false positive is for fold ',string(FalsePositiveBiasModel.fold), ' and cost at ', string(FalsePositiveBiasModel.cost)));


  save ('FalseNegativeBiasModel.mat','FalseNegativeBiasModel');
  disp(strcat('The best model optimizing for minimal false negative is for fold ',string(FalseNegativeBiasModel.fold), ' and cost at ', string(FalseNegativeBiasModel.cost)));

  %Final result is based on the predited label of the model.

  %Require Fig converter at https://www.mathworks.com/matlabcentral/fileexchange/16906-convert-fig-files-to-images
  % Convert all figs. into JPG files.
  export_figs('jpg');

  % Return where we come from.
  cd(currentDir);
  figure('Visible','on');
  %------------- END OF CODE --------------
end
