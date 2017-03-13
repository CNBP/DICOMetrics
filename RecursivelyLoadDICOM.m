function Output = RecursivelyLoadDICOM()
%RecursivelyLoadDICOM - Main initailizer of the function to load all DICOM files. 
%
% Syntax:   Output = RecursivelyLoadDICOM()
%
% Inputs:
%
% Outputs:			
%    	Output			- the matrix array that contains ALL results. 
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

% Elaborate on the specific numbers of metrics loop that are required to calculated these metrics
NbFocusMetrics 	= 28;
NbSNRMetrics 	= 15;
NbFocusMetrics 	= 5;

% Define algorithm types:
FocusMetrics 	= 1;
SNRMetrics 		= 2;
TextureMetrics 	= 3;


% Use GUI to get path to the folder that contained all the DICOM files. 
path = uigetdir;
cd(path);

% Get current path of current script. 
scriptName = mfilename('fullpath');
[currentpath, filename, fileextension]= fileparts(scriptName);

% Ensure dependencies are properly referred to
addpath(genpath('Dependency_General'));


% Recursively obtain all files using dirrec.m
files = dirrec(path);



%Loop at per algorithm level  % Do Focus Measure
for algoIndex = 1:NbFocusMetrics
    
    %This counter keeps track which calculation tnis was for. 
    counter = 1;
    
    for fileIndex = 1:length(files)
        
        % Check if the file is dicome. 
        if isdicom(files{fileIndex})	
            
            Result = ProcessSingleDICOMInput(files{fileIndex}, FocusMetrics, algoIndex);            
            
            VariousScores{counter}= Result;
            
            FileName{counter}=files{fileIndex};
            counter = counter +1;
        end
    end
    
    Output{algoIndex} = struct('Files',FileName, 'Scores', VariousScores);
    
end

%Loop at per algorithm level % Do SNR Measure
for algoIndex = 1:NbSNRMetrics
	
    %This counter keeps track which calculation tnis was for. 
    counter = 1;
    
    for fileIndex = 1:length(files)
        
        % Check if the file is dicome. 
        if isdicom(files{fileIndex})	
            
            Result = ProcessSingleDICOMInput(files{fileIndex}, SNRMetrics, algoIndex);            
            
            VariousScores{counter}= Result;
            
            FileName{counter}=files{fileIndex};
            counter = counter +1;
        end
    end
    
    Output{algoIndex} = struct('Files',FileName, 'Scores', VariousScores);
    
end

%Loop at per algorithm level  % Do Texture Measure
for algoIndex = 1:NbFocusMetrics
	
    %This counter keeps track which calculation tnis was for. 
    counter = 1;
    
    for fileIndex = 1:length(files)
        
        % Check if the file is dicome. 
        if isdicom(files{fileIndex})	
            
            Result = ProcessSingleDICOMInput(files{fileIndex}, TextureMetrics, algoIndex);            
            
            VariousScores{counter}= Result;
            
            FileName{counter}=files{fileIndex};
            counter = counter +1;
        end
    end
    
    Output{algoIndex} = struct('Files',FileName, 'Scores', VariousScores);
    
end


%------------- END OF CODE --------------
end
