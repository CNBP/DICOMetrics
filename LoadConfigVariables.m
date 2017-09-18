function Output = LoadConfigVariables()
%LoadConfigVariables - Return the config structure that is used by all other function
%This serves as the MASTER variable/settings ini file.
%
% Syntax:  [output1,output2] = function_name(input1,input2,input3)
%
% Inputs:
%     none
%
% Outputs:
%    	Output			- the setting output that contains a series of configuration parameters.
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
% 2017-08; Last revision: 2017-08-09 23:07:22 Eastern Time

%------------- BEGIN CODE --------------

  %This is the entry function to load all things.

  % total number of metric types
  Output.NbMetricTypes = 6;

  % Define algorithm types:
  Output.IndexFileRecords 	   = 1;

  Output.IndexFocusMetrics 	   = 2;
  Output.IndexSNRMetrics 		   = 3;
  Output.IndexTextureMetrics 	 = 4;
  Output.IndexLiveLabMetrics   = 5;
  Output.IndexDICOMMetrics 	   = 6;

  % Elaborate on the specific numbers of metrics loop that are required to calculated these metrics
  Output.NbFocusMetrics 		 = 28;
  Output.NbSNRMetrics 		   = 15;
  Output.NbTextureMetrics 	 = 23;
  Output.NbLiveLabMetrics	   = 2;
  Output.NbDICOMMetrics  	   = 27;

  Output.NbMetrics(Output.IndexFileRecords)    = 1;
  Output.NbMetrics(Output.IndexFocusMetrics) 	 = Output.NbFocusMetrics;
  Output.NbMetrics(Output.IndexSNRMetrics) 	   = Output.NbSNRMetrics;
  Output.NbMetrics(Output.IndexTextureMetrics) = Output.NbTextureMetrics;
  Output.NbMetrics(Output.IndexLiveLabMetrics) = Output.NbLiveLabMetrics;
  Output.NbMetrics(Output.IndexDICOMMetrics)   = Output.NbDICOMMetrics;


  scriptName = mfilename('fullpath');
  [currentpath, filename, fileextension]= fileparts(scriptName);


  Output.RootDirectory = pwd;
  Output.ResultFolder = [currentpath '\Results'];

  %Classifier configuration variables
  Output.ClassifierCount = 6;
  Output.CrossValidationFold = 10;
  % Ensure dependencies are properly referred to


%------------- END OF CODE --------------
end
