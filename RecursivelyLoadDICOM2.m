function Output = RecursivelyLoadDICOM2()

%use GUI to get path. 
path = uigetdir;
cd(path);

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