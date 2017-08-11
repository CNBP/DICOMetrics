function [OutputLabels, OutputScores] = SingleModelPredictor(metrics, inputSingleModel)
  % OutputLabels - Return an array of label based on the inputted SINGLE model (not CVed) and based on the metric input, not model or metric specific
  %
  % Syntax:  OutputLabels = RUSBoostClassifer(metrics,trueLabels)
  %
  % Inputs:
  %    	metrics 			- metrics per subject, observations in rows, metrics arranged in columns.
  %    	trueLabels 		- X by 1 vector labeling the subjects.
  %     inputSingleModel         - the previously computed inputSingleModel
  % Outputs:
  %    	PredictedLabel - X by 1 vector labeling the subjects based on the inputSingleModel.
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
  % 2017-07; Last revision: 2017-08-09 23:06:54 Eastern Time

  %=======BEGIN Rejection Area
  %RUSBoost Predictions.
  OutputLabels = [];

  % Check if metrics and labels have the same rows.
  if isempty(metrics) || isempty(inputSingleModel)
    error('Fatal Error: metrics or inputSingleModel are empty and not valid!');
    return; %Return if the default mistake is not a number.
  elseif (size(metrics,2) ~= size(inputSingleModel.X,2))
    error('Fatal Error:Input model and input metric do not match in terms of metrics and cannot process. Make sure metrics have the SAME number of COLUMNS!');
    return;
  end

  % Generate output based on prediction.
  [OutputLabels,OutputScores]= predict(inputSingleModel,metrics);

  %------------- END OF CODE --------------
end
