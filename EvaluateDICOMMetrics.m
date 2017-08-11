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

%------------- BEGIN CODE --------------

  switch AlgoIndex
    case 1
      Output = DCMInfo.FileSize;
    case 2
      Output = DCMInfo.Width;
    case 3
      Output = DCMInfo.Height;
    case 4
      Output = DCMInfo.BitDepth;
    case 5
      Output = DCMInfo.SliceThickness;
    case 6
      Output = DCMInfo.RepetitionTime;
    case 7
      Output = DCMInfo.EchoTime;
    case 8
      Output = DCMInfo.NumberOfAverages;
    case 9
      Output = DCMInfo.ImagingFrequency;
    case 10
      Output = DCMInfo.EchoNumber;
    case 11
      Output = DCMInfo.MagneticFieldStrength;
    case 12
      Output = DCMInfo.SpacingBetweenSlices;
    case 13
      Output = DCMInfo.NumberOfPhaseEncodingSteps;
    case 14
      Output = DCMInfo.EchoTrainLength;
    case 15
      Output = DCMInfo.PercentSampling;
    case 16
      Output = DCMInfo.PercentPhaseFieldOfView;
    case 17
      Output = DCMInfo.PixelBandwidth;
    case 18
      Output = DCMInfo.DeviceSerialNumber;
    case 19
      Output = DCMInfo.FlipAngle;
    case 20
      Output = DCMInfo.SAR;
    case 21
      Output = DCMInfo.SeriesNumber;
    case 22
      Output = DCMInfo.AcquisitionNumber;
    case 23
      Output = DCMInfo.InstanceNumber;
    case 24
      Output = DCMInfo.SliceLocation;
    case 25
      Output = DCMInfo.LargestImagePixelValue;
    case 26
      Output = DCMInfo.WindowCenter;
    case 27
      Output = DCMInfo.WindowWidth;
  end

%------------- END OF CODE --------------
end
