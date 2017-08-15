function Output = Step2ClassifiersTests(DataMatrix,labelBinary)
%RecursivelyAnalyzeResults - Main initailizer of the function to load all DICOM files.
%
% Syntax:   Output = RecursivelyAnalyzeResults()
%
% Inputs:
%
% Outputs:
%    	Output			- the matrix array that contains ALL results.
%		Dimension 1: File Number
% 	Dimension 2: Algo Index
%		Dimension 3: Algo Type
%
%
% Other m-files required: 		dirrec.m; ProcessSingleDICOMInput;
% Subfunctions: 				none
% MAT-files required: 			none
%
% Author: Yang Ding
% All works sponsored by Dr. Gregory Lodygensky and the Canadian Neonatal Brain Platform
% Saint. Justine Hospital, Montreal, Quebec,
% email address: it@cnbp.ca
% Website: http://cnbp.ca
% 2017-03; Last revision: 2017-08-15 09:06:13 Eastern Time

%------------- BEGIN CODE --------------

% The structure that will be used to contain all output.
Output = struct;

% Read in the setting files
Setting = LoadConfigVariables();

%This is the entry function to load all things such as the following:

% % Define algorithm types:
% FileRecords 	= 1;
% FocusMetrics 	= 2;
% SNRMetrics 		= 3;
% TextureMetrics 	= 4;
% LiveLabMetrics 	= 5;

% % Elaborate on the specific numbers of metrics loop that are required to calculated these metrics
% NbFocusMetrics 		= 28;
% NbSNRMetrics 		= 15;
% NbTextureMetrics 	= 5;
% NbLiveLabMetrics 	= 2;

% NbMetrics(FileRecords)      = 1;
% NbMetrics(FocusMetrics) 	= NbFocusMetrics;
% NbMetrics(SNRMetrics) 		= NbSNRMetrics;
% NbMetrics(TextureMetrics) 	= NbTextureMetrics;
% NbMetrics(LiveLabMetrics) 	= NbLiveLabMetrics;

% % total number of metric types
% NbMetricTypes = 5;

  %Loop through all classes in the labelBinary.
  for labelBinaryColumnIndex = 1:size(labelBinary,2)
      %Record all FILES:
      for ClassiferIndex = 1:Setting.ClassiferCount;
          % Check if the file is dicom.
          ClassiferInfo = ClassifiersAnalyses(DataMatrix, labelBinary(:,labelBinaryColumnIndex), ClassiferIndex, Setting.CrossValidationFold);

          % Copy over the classifier info.
          Output(ClassiferIndex,labelBinaryColumnIndex).Classifier   = ClassiferInfo.Classifier;
          Output(ClassiferIndex,labelBinaryColumnIndex).ResubError   = ClassiferInfo.ResubError;
          Output(ClassiferIndex,labelBinaryColumnIndex).cvClassifier = ClassiferInfo.cvClassifier;
          Output(ClassiferIndex,labelBinaryColumnIndex).cvResubError = ClassiferInfo.cvResubError;
          disp(['Classifier Type ',num2str(ClassiferIndex), 32, 'is Completed.']);
      end

      disp(['labelBinary Type ',num2str(labelBinaryColumnIndex),32, 'Completed.']);
  end

%------------- END OF CODE --------------
end
