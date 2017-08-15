function Output = Execute(label)
% Main Analyses Script. This is the entry point for ALL automated analyses.
%
% Syntax:  [output1,output2] = function_name(input1,input2,input3)
%
% Inputs:
%    	filePath 			- input path to the ROOT folder where all the folders OF images are located.
%    	labelPath 		- a vertical array of labels that contain exactly the same number of rows as the number of DICOM file that exist.
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
% 2017-03; Last revision: 2017-08-09 23:24:39 Eastern Time

%------------- BEGIN CODE --------------
% Author: Yang Ding
% All works sponsored by Dr. Gregory Lodygensky and the Canadian Neonatal Brain Platform
% Saint. Justine Hospital, Montreal, Quebec,
% email address: it@cnbp.ca
% Website: http://cnbp.ca
% 2017-03; Last revision: 10:26 AM 2017-03-02

%------------- BEGIN CODE --------------
  clc;
  clear;
  % Get Main path;
  path                  = uigetdir;

  % Step1: Use path to derive metrics;
  Metrics               = Step1ExtractMetrics(path);

  % Must check Metrics dimention vs labelPath size dimension
  if (checkSize(Metrics,label))
    % Step 2:
    ClassificationSummary = Step2ClassifiersTests(Metrics,label);

  else
    error('Data metrics and/or Data Class Label size mistmatch/emtpy. Please double check those two variables. ')
  end

  %Step3ShowResults(ClassificationSummary);
%------------- END OF CODE --------------
end
