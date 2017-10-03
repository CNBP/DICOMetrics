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
  scriptName = mfilename('fullpath');
  [currentpath, ~, ~]= fileparts(scriptName);

  Output.Folder.Root           = pwd;
  Output.Folder.Algos          = [currentpath '\Dependency_Algos'];
  Output.Folder.DICOM          = [currentpath '\Dependency_DICOM'];
  Output.Folder.FocusMetrics   = [currentpath '\Dependency_FocusMetrics'];
  Output.Folder.General        = [currentpath '\Dependency_General'];
  Output.Folder.LiveLabMetrics = [currentpath '\Dependency_LiveLabMetrics'];
  Output.Folder.SNRMetrics     = [currentpath '\Dependency_SNRMetrics'];
  Output.Folder.TextureMetrics = [currentpath '\Dependency_TextureMetrics'];
  Output.Folder.Classification = [currentpath '\Classification'];
  Output.Folder.Result         = [currentpath '\Results'];

  % Study specific settings
  Output.Folder.ASP = [currentpath '\Results' '\ASP'];
  Output.Folder.ASPMetrics = [currentpath '\Results' '\ASP' '\Metrics'];
  Output.Folder.ASPModels = [currentpath '\Results' '\ASP' '\Models'];
  Output.Folder.BDP = [currentpath '\Results' '\BDP'];
  Output.Folder.BDPMetrics = [currentpath '\Results' '\BDP' '\Metrics'];
  Output.Folder.BDPModels = [currentpath '\Results' '\BDP' '\Models'];

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
  addpath(Output.Folder.Algos);
  Output.NbFocusMetrics 		 = AlgoCount(Output.IndexFocusMetrics   );
  Output.NbSNRMetrics 		   = AlgoCount(Output.IndexSNRMetrics 		);
  Output.NbTextureMetrics 	 = AlgoCount(Output.IndexTextureMetrics );
  Output.NbLiveLabMetrics	   = AlgoCount(Output.IndexLiveLabMetrics );
  Output.NbDICOMMetrics  	   = AlgoCount(Output.IndexDICOMMetrics 	);

  Output.NbMetrics(Output.IndexFileRecords)    = 1;
  Output.NbMetrics(Output.IndexFocusMetrics) 	 = Output.NbFocusMetrics;
  Output.NbMetrics(Output.IndexSNRMetrics) 	   = Output.NbSNRMetrics;
  Output.NbMetrics(Output.IndexTextureMetrics) = Output.NbTextureMetrics;
  Output.NbMetrics(Output.IndexLiveLabMetrics) = Output.NbLiveLabMetrics;
  Output.NbMetrics(Output.IndexDICOMMetrics)   = Output.NbDICOMMetrics;




  %Classifier configuration variables
  Output.ClassifierCount = 6;
  Output.CrossValidationFold = 10;
  % Ensure dependencies are properly referred to


%------------- END OF CODE --------------
end
