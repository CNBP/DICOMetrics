function Count = AlgoCount(TypeIndex)
% NAME - This algorithm is run to initilize all the algorithm names and as well as the count and indexes of them for subsequent label and resuse.
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
% 2017; Last revision:

  IndexFocusMetrics 	= 2;
  IndexSNRMetrics 		= 3;
  IndexTextureMetrics = 4;
  IndexNSSMetrics = 5;
  IndexDICOMMetrics 	= 6;

% Default AlgoIndex
DefaultIndex = 0;

switch TypeIndex
  case IndexFocusMetrics
    [~, Count] = AlgoFocus(DefaultIndex);
  case IndexSNRMetrics
    [~, Count] = AlgoSNR(DefaultIndex);
  case IndexTextureMetrics
    [~, Count] = AlgoTexture(DefaultIndex);
  case IndexNSSMetrics
    [~, Count] = AlgoNSS(DefaultIndex);
  case IndexDICOMMetrics
    [~, Count] = AlgoDICOM(DefaultIndex);
end

%------------- END OF CODE --------------
end
