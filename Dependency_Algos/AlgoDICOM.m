function [Name, Count] = AlgoDICOM(Index)
  % NAME - This function returns the name of the specific index requested as well as the count of all current DICOM metrics implemented.
  %
  % Syntax:  []] = AlgoTemplater(1,0)
  %
  % Inputs:
  %    	TypeIndex 			- Input about the type of algorithms in general.
  %    	AlgoIndex 			- Input about the algorithm in general. (if 0, return count of the typeindex)
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
  % 2017; Last revision: 2017-10-03 11:32:48 Eastern Time

  AlgoDICOM{ 1} = 'Dicom_FileSize';
  AlgoDICOM{ 2} = 'Dicom_Width';
  AlgoDICOM{ 3} = 'Dicom_Height';
  AlgoDICOM{ 4} = 'Dicom_BitDepth';
  AlgoDICOM{ 5} = 'Dicom_SliceThickness';
  AlgoDICOM{ 6} = 'Dicom_RepetitionTime';
  AlgoDICOM{ 7} = 'Dicom_EchoTime';
  AlgoDICOM{ 8} = 'Dicom_NumberOfAverages';
  AlgoDICOM{ 9} = 'Dicom_ImagingFrequency';
  AlgoDICOM{10} = 'Dicom_EchoNumber';
  AlgoDICOM{11} = 'Dicom_MagneticFieldStrength';
  AlgoDICOM{12} = 'Dicom_SpacingBetweenSlices';
  AlgoDICOM{13} = 'Dicom_NumberOfPhaseEncodingSteps';
  AlgoDICOM{14} = 'Dicom_EchoTrainLength';
  AlgoDICOM{15} = 'Dicom_PercentSampling';
  AlgoDICOM{16} = 'Dicom_PercentPhaseFieldOfView';
  AlgoDICOM{17} = 'Dicom_PixelBandwidth';
  AlgoDICOM{18} = 'Dicom_DeviceSerialNumber';
  AlgoDICOM{19} = 'Dicom_FlipAngle';
  AlgoDICOM{20} = 'Dicom_SAR';
  AlgoDICOM{21} = 'Dicom_SeriesNumber';
  AlgoDICOM{22} = 'Dicom_AcquisitionNumber';
  AlgoDICOM{23} = 'Dicom_InstanceNumber';
  AlgoDICOM{24} = 'Dicom_SliceLocation';
  AlgoDICOM{25} = 'Dicom_LargestImagePixelValue';
  AlgoDICOM{26} = 'Dicom_WindowCenter';
  AlgoDICOM{27} = 'Dicom_WindowWidth';


  [Name, Count] = AlgoName(AlgoDICOM,Index);
%------------- END OF CODE --------------
end
