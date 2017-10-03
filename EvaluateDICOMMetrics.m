function Output = EvaluteDICOMMetrics(Image, AlgoIndex)
%Config - Return the config structure that is used by all other function
%This serves as the MASTER variable/settings ini file.
%
% Syntax:  [output1,output2] = function_name(input1,input2,input3)
%
% Inputs:
%    	input1 			- Description
%    	input2 			- Description
%    	input3 			- Description
%
% Outputs:
%    	output1			- Description
%    	output2			- Description
%
% Example:
%    	Line 1 of example
%    	Line 2 of example
%    	Line 3 of example
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
% 2017-03; Last revision: 10:26 AM 2017-03-02


%Use DCMINFO to extract the variety of structural informations.
DCMInfo = dicominfo(Image);

%#################
% MAKE SUER TO UPDATE THE Algo as well! 
%#################
%------------- BEGIN CODE --------------

  switch AlgoIndex
    case 1
      Output = double(DCMInfo.FileSize);
    case 2
      Output = double(DCMInfo.Width);
    case 3
      Output = double(DCMInfo.Height);
    case 4
      Output = double(DCMInfo.BitDepth);
    case 5
      Output =  double(DCMInfo.SliceThickness);
    case 6
      Output =  double(DCMInfo.RepetitionTime);
    case 7
      Output =  double(DCMInfo.EchoTime);
    case 8
      Output =  double(DCMInfo.NumberOfAverages);
    case 9
      Output =  double(DCMInfo.ImagingFrequency);
    case 10
      Output =  double(DCMInfo.EchoNumber);
    case 11
      Output =  double(DCMInfo.MagneticFieldStrength);
    case 12
      Output =  double(DCMInfo.SpacingBetweenSlices);
    case 13
      Output =  double(DCMInfo.NumberOfPhaseEncodingSteps);
    case 14
      Output =  double(DCMInfo.EchoTrainLength);
    case 15
      Output = double(DCMInfo.PercentSampling);
    case 16
      Output = double(DCMInfo.PercentPhaseFieldOfView);
    case 17
      Output = double(DCMInfo.PixelBandwidth);
    case 18
      Output = str2double(DCMInfo.DeviceSerialNumber);
    case 19
      Output = double(DCMInfo.FlipAngle);
    case 20
      Output = double(DCMInfo.SAR);
    case 21
      Output = double(DCMInfo.SeriesNumber);
    case 22
      Output = double(DCMInfo.AcquisitionNumber);
    case 23
      Output = double(DCMInfo.InstanceNumber);
    case 24
      Output = double(DCMInfo.SliceLocation);
    case 25
      Output = double(DCMInfo.LargestImagePixelValue);
    case 26
      Output = double(DCMInfo.WindowCenter);
    case 27
      Output = double(DCMInfo.WindowWidth);
  end

%------------- END OF CODE --------------
end
