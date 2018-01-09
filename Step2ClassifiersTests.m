function Output = Step2ClassifiersTests(DataMatrix,labelBinary)
%RecursivelyAnalyzeResults - Main initailizer of the function to load all DICOM files.
%
% Syntax:   Output = RecursivelyAnalyzeResults()
%
% Inputs:
%    labelBinary      0 for bad images, 1 for good images.
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
% NSSMetrics 	= 5;

% % Elaborate on the specific numbers of metrics loop that are required to calculated these metrics
% NbFocusMetrics 		= 28;
% NbSNRMetrics 		= 15;
% NbTextureMetrics 	= 5;
% NbNSSMetrics 	= 2;

% NbMetrics(FileRecords)      = 1;
% NbMetrics(FocusMetrics) 	= NbFocusMetrics;
% NbMetrics(SNRMetrics) 		= NbSNRMetrics;
% NbMetrics(TextureMetrics) 	= NbTextureMetrics;
% NbMetrics(NSSMetrics) 	= NbNSSMetrics;

% % total number of metric types
% NbMetricTypes = 5;

  %Loop through all classes in the labelBinary.
  for labelBinaryColumnIndex = 1:size(labelBinary,2)
      %Record all FILES:
      for ClassifierIndex = 1:Setting.ClassifierCount;
          % Check if the file is dicom.
          ClassifierInfo = ClassifiersAnalyses(DataMatrix, labelBinary(:,labelBinaryColumnIndex), ClassifierIndex, Setting.CrossValidationFold);
          if (isempty(ClassifierInfo))
            % Copy over the classifier info.
            Output(ClassifierIndex,labelBinaryColumnIndex).Classifier   = []
            Output(ClassifierIndex,labelBinaryColumnIndex).Mistakes     = 9999;
            Output(ClassifierIndex,labelBinaryColumnIndex).FalseNegative= 9999;
            Output(ClassifierIndex,labelBinaryColumnIndex).FalsePositive= 9999;
          else
            % Copy over the classifier info.
            Output(ClassifierIndex,labelBinaryColumnIndex).Classifier   = ClassifierInfo;
            Output(ClassifierIndex,labelBinaryColumnIndex).Mistakes     = ClassifierInfo.Mistakes     ;
            Output(ClassifierIndex,labelBinaryColumnIndex).FalseNegative= ClassifierInfo.FalseNegative;
            Output(ClassifierIndex,labelBinaryColumnIndex).FalsePositive= ClassifierInfo.FalsePositive;
          end

          disp(['Classifier Type ' num2str(ClassifierIndex) 32 'is Completed.']);
      end

      disp(['LabelBinary Type ' num2str(labelBinaryColumnIndex) 32 'Completed.']);
  end

%------------- END OF CODE --------------
end
