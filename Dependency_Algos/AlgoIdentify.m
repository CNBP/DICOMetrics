function Name = AlgoIdentify(TypeIndex,AlgoIndex)
% NAME - DESCRIPTION
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
% 2017; Last revision: 2017-10-03 13:34:27 Eastern Time

%------------- BEGIN CODE --------------
IndexFocusMetrics 	= 2;
IndexSNRMetrics 		= 3;
IndexTextureMetrics = 4;
IndexLiveLabMetrics = 5;
IndexDICOMMetrics 	= 6;

% Default AlgoIndex
DefaultIndex = 0;

switch TypeIndex
case IndexFocusMetrics
  [Name, ~] = AlgoFocus(AlgoIndex);
case IndexSNRMetrics
  [Name, ~] = AlgoSNR(AlgoIndex);
case IndexTextureMetrics
  [Name, ~] = AlgoTexture(AlgoIndex);
case IndexLiveLabMetrics
  [Name, ~] = AlgoLiveLab(AlgoIndex);
case IndexDICOMMetrics
  [Name, ~] = AlgoDICOM(AlgoIndex);
end


%------------- END OF CODE --------------
end
