function metrics = ProcessSingleDICOMInput(Input, Algo)
    
    %Read image. 
    ImageInBuffer = dicomread(Input);
    
    %Convert image to double. 
    InputRGBImageDouble = im2double(ImageInBuffer);
           
    metrics = EvaluateSNRMetric(InputRGBImageDouble, Algo);
end 