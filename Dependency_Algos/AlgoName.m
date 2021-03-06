function [Name, Count] = AlgoName(AlgoNameArray,Index)
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
% 2017; Last revision:

%------------- BEGIN CODE --------------

if(isempty(AlgoNameArray))
  error 'Must have input name array'
end

  %Store Count!
  [~, Count] = size(AlgoNameArray);

  %If valid index, store name as well.
  if (Index == 0)
    Name = 'Invalid';
  elseif ( 0 < Index && Index < Count + 1 && floor(Index)==Index)
    Name = AlgoNameArray{Index};
  else
    error 'Algorithm Index out of bound for Algorithm Type!'
  end
%------------- END OF CODE --------------
end
