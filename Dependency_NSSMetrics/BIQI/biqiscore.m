function Output = biqiscore(im)
% biqiscore - BIQI has this weird behaviour where on CERTAIN images, it return an array instead of just a score, causing crazy ham to extrue honey and milk and world burning bheaviours...
% Now, this just take the score.
%
% Syntax:  [Output, ~] = biqiscore(im)
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
% Creation: 2018-01-11T17:00:07.522Z; Last revision:

%------------- BEGIN CODE --------------
  % Final return
  [Output, ~] = biqi(im);
%------------- END OF CODE --------------
end
