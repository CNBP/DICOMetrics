function metrics = ProcessSingleDICOMInput(Input, AlgoType, Algo)
    
    %Read image. 
    ImageInBuffer = dicomread(Input);
    
    %Convert image to double. 
    InputRGBImageDouble = im2double(ImageInBuffer);
    

	switch (AlgoType)	
		case 1 % Focus Metrics
			metrics = EvaluateFocusMetrics(InputRGBImageDouble, Algo);
		case 2 % SNR Metrics
			metrics = EvaluateSNRMetrics(InputRGBImageDouble, Algo);
		case 3 % Texture Metrics
			metrics = EvaluateTextureMetrics(InputRGBImageDouble, Algo);
	end
   
end 