function Output = RecursivelyAnalyzeResults()
%RecursivelyAnalyzeResults - Main initailizer of the function to load all DICOM files. 
%
% Syntax:   Output = RecursivelyAnalyzeResults()
%
% Inputs:
%
% Outputs:			
%    	Output			- the matrix array that contains ALL results. 
%		Dimension 1: File Number
% 		Dimension 2: Algo Index
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
% 2017-03; Last revision: 12:32 PM March 13, 2017

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

% combine all variabels into one large data shseet



%============
%AlgoType: 1
%============
%Record all FILES:
for fileIndex = 1:length(files)    
	% Check if the file is dicom. 
	if isdicom(files{fileIndex})	                    
		Results{fileIndex, Setting.NbMetrics(FileRecords),Setting.FileRecords} = files{fileIndex};			
	end
end


%===================
% Algo Type: 2 to 5
%===================
%Loop at the algorithm TYPE level
for algoType = 2:NbMetricTypes
	
	%Loop at per algorithm level  % Do Focus Measure
	for algoIndex = 1:NbMetrics(algoType)       
		
		%Loop at the per file level
		for fileIndex = 1:length(files)        
			
			% At per file level, check if the file is dicom. 
			if isdicom(files{fileIndex})	            
				
				%Calculate the focus metrics score
				Result = ProcessSingleDICOMInput(files{fileIndex}, algoIndex, algoType);
				
				%record the focus metric score in a catch all CELL ARRAY
				Results{fileIndex,algoIndex,algoType} = Result;					
				
            end			
            %fprintf(['File %i.\n', fileIndex, ' out of %i ', length(files), ' in Algo %i ', algoIndex, 'of AlgoType %i ', algoType, 'finished. \n\l']) 
		end
		%End Per file level loop
        
        %Update UI:
        %fprintf(['Algo ', algoIndex, ' out of ', NbMetrics(algoType), ' in AlgoType ', algoType, ' out of ' NbMetricTypes, 'finished.']) 
        
	end
	% End per algorithm level. 
end
% End per algorithm TYPE level.


% Update the output struct and it's relevant file structure to store the proper information. 
% Convert CELL array to MATRIX
Output.FileRecords 		= cell2mat(Results (:,1:NbMetrics(FileRecords),		FileRecords 	));
Output.FocusMetrics 	= cell2mat(Results (:,1:NbMetrics(FocusMetrics),	FocusMetrics 	));
Output.SNRMetrics 		= cell2mat(Results (:,1:NbMetrics(SNRMetrics),		SNRMetrics 		));
Output.TextureMetrics 	= cell2mat(Results (:,1:NbMetrics(TextureMetrics),	TextureMetrics	));
Output.LiveLabMetrics 	= cell2mat(Results (:,1:NbMetrics(LiveLabMetrics),	LiveLabMetrics	));

% Put everything in a gigantic matrix for further analyses. 
ComprehensiveMatrix = cat (2, Output.FocusMetrics, Output.SNRMetrics, Output.TextureMetrics, Output.LiveLabMetrics);


                  
%------------- END OF CODE --------------
end
