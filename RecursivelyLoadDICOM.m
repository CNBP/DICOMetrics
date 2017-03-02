function Output = RecursivelyLoadDICOM()
%Author Yang Ding
% 2017-03-02 



%use GUI to get path. 
path = uigetdir;
cd(path);

%Get current path. 
scriptName = mfilename('fullpath');
[currentpath, filename, fileextension]= fileparts(scriptName);

% Ensure dependencies are properly referred to
addpath(genpath('Dependency_General'));


%Recursively obtain all files. 
files = dirrec(path);

%Loop at per algorithm level 
for algoIndex = 1:15
    
    %This counter keeps track which calculation tnis was for. 
    counter = 1;
    
    for fileIndex = 1:length(files)
        
        % Check if the file is dicome. 
        if isdicom(files{fileIndex})	
            
            Result = ProcessSingleDICOMInput(files{fileIndex}, algoIndex);            
            
            VariousScores{counter}= Result;
            
            FileName{counter}=files{fileIndex};
            counter = counter +1;
        end
    end
    
    Output{algoIndex} = struct('Files',FileName, 'Scores', VariousScores);
    
end
end
% 