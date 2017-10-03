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

  AlgoDICOM{ 1} = 'DicomFileSize';
  AlgoDICOM{ 2} = 'DicomWidth';
  AlgoDICOM{ 3} = 'DicomHeight';
  AlgoDICOM{ 4} = 'DicomBitDepth';
  AlgoDICOM{ 5} = 'DicomSliceThickness';
  AlgoDICOM{ 6} = 'DicomRepetitionTime';
  AlgoDICOM{ 7} = 'DicomEchoTime';
  AlgoDICOM{ 8} = 'DicomNumberOfAverages';
  AlgoDICOM{ 9} = 'DicomImagingFrequency';
  AlgoDICOM{10} = 'DicomEchoNumber';
  AlgoDICOM{11} = 'DicomMagneticFieldStrength';
  AlgoDICOM{12} = 'DicomSpacingBetweenSlices';
  AlgoDICOM{13} = 'DicomNumberOfPhaseEncodingSteps';
  AlgoDICOM{14} = 'DicomEchoTrainLength';
  AlgoDICOM{15} = 'DicomPercentSampling';
  AlgoDICOM{16} = 'DicomPercentPhaseFieldOfView';
  AlgoDICOM{17} = 'DicomPixelBandwidth';
  AlgoDICOM{18} = 'DicomDeviceSerialNumber';
  AlgoDICOM{19} = 'DicomFlipAngle';
  AlgoDICOM{20} = 'DicomSAR';
  AlgoDICOM{21} = 'DicomSeriesNumber';
  AlgoDICOM{22} = 'DicomAcquisitionNumber';
  AlgoDICOM{23} = 'DicomInstanceNumber';
  AlgoDICOM{24} = 'DicomSliceLocation';
  AlgoDICOM{25} = 'DicomLargestImagePixelValue';
  AlgoDICOM{26} = 'DicomWindowCenter';
  AlgoDICOM{27} = 'DicomWindowWidth';


  [Name, Count] = AlgoName(AlgoDICOM,Index);
%------------- END OF CODE --------------
end
