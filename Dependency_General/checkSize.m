function Output = checkSize(metrics,label)
% checkSize - check the metrics against the label to ensure that 1) they are both valid, 2) they are describing the same thing
%
% Syntax:  [output1,output2] = function_name(input1,input2,input3)
%
% Inputs:
%    	metrics 		- 2d array of Step1 output which describe the 96+ metrics for each image a row.
%    	label 			- 1d vector of class label. Must have the same row as metrics.
%
% Outputs:
%    	Ouput			- boolean description of whether the size check succeed or failed
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
% 2017; Last revision: 2017-08-15 08:27:16 Eastern Time

%------------- BEGIN CODE --------------

% Default return;
Output = false;

  % Get how many subjects extracted the metrics for:
  % Check if metrics and labels have the same rows.
  if (isempty(metrics) || isempty(label))
    error('Fatal Error:Input EMPTY!');
    return;
  elseif (size(metrics,1) ~= size(label,1))
    error('Fatal Error:Input rows do not match and cannot process. Make sure labels and metrics have the SAME number of rows!');
    return;
  elseif (size(size(Metrics),2) ~= 2)
    error('Fatal Error:Input metrics must be a 2d array!');
    return;
  elseif (size(size(label),2) ~= 1)
    error('Fatal Error:Input metrics must be a 1d vector!');
    return;
  end

  Output = true;
%------------- END OF CODE --------------
end
