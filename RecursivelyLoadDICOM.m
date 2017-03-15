function Output = RecursivelyLoadDICOM()
%RecursivelyLoadDICOM - Main initailizer of the function to load all DICOM files. 
%
% Syntax:   Output = RecursivelyLoadDICOM()
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

%This is the entry function to load all things. 

% Define algorithm types:
FileRecords 	= 1;
FocusMetrics 	= 2;
SNRMetrics 		= 3;
TextureMetrics 	= 4;
LiveLabMetrics 	= 5;

% Elaborate on the specific numbers of metrics loop that are required to calculated these metrics
NbFocusMetrics 		= 28;
NbSNRMetrics 		= 15;
NbTextureMetrics 	= 5;
NbLiveLabMetrics 	= 2;

NbMetrics(FileRecords)      = 1;
NbMetrics(FocusMetrics) 	= NbFocusMetrics;
NbMetrics(SNRMetrics) 		= NbSNRMetrics;
NbMetrics(TextureMetrics) 	= NbTextureMetrics;
NbMetrics(LiveLabMetrics) 	= NbLiveLabMetrics;


% total number of metric types
NbMetricTypes = 5;

% Get current path of current script. 
scriptName = mfilename('fullpath');
[currentpath, filename, fileextension]= fileparts(scriptName);

% Ensure dependencies are properly referred to
addpath(genpath(currentpath));
addpath(genpath([currentpath,'\Dependency_General']));

% Use GUI to get path to the folder that contained all the DICOM files. 
path = uigetdir;
cd(path);

% Recursively obtain all files using dirrec.m
files = dirrec(path);

%============
%AlgoType: 1
%============
%Record all FILES:
for fileIndex = 1:length(files)    
	% Check if the file is dicom. 
	if isdicom(files{fileIndex})	                    
		Output{fileIndex,NbMetrics(FileRecords),FileRecords} = files{fileIndex};			
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
				
				%record the focus metric score
				Output{fileIndex,algoIndex,algoType} = Result;					
				
			end
			
		end
		%End Per file level loop		
	end
	% End per algorithm level. 
end
% End per algorithm TYPE level.


%------------- END OF CODE --------------
end
