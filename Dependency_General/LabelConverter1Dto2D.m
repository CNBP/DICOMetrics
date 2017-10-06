function Output = LableConverter1Dto2D(Label1D)
% LableConverter1Dto2D - converts a 1D label to 2D binary label. Useful when sometimes some input better use 1D while other time it is better to use 2D labels.
% Class label must be 0 and 1 where 0 is NON-TARGET, 1 is TARGET
%
% Syntax:  Label2D = LableConverter1Dto2D(Label1D)
%
% Inputs:
%    	Label1D 			- 1D classification label of the groups.
%
% Outputs:
%    	Output			- 2D classification label of the groups.
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
% 2017; Last revision: 2017-08-15 08:40:54 Eastern Time




%------------- BEGIN CODE --------------
  % Default return
  Output = [];

  % Input quality check.
  if (isempty(Label1D))
    error('Fatal Error:Input label is EMPTY!');
  elseif (~isa(Label1D,'double'))
    error('Fatal Error:Input label must be double!');
  elseif (max(Label1D)~= 1)
    error('Fatal Error: max classification label value must be 1');
  elseif (min(Label1D)~= 0 && min(Label1D)~= 1) % In the case when predicted all lables of 1, can happen with TINY positive case count and shitty prediction labels.
    disp(min(Label1D));
    error('Fatal Error: min classification label value must be 0 or 1.');
  elseif (numel(unique(Label1D)) > 2)
      disp(numel(unique(Label1D)));
    error('Fatal Error: there can only be 1 o 0');
  end


  % Compute and concatenate Binary PREDICTED Labels
  TargetImagePredictedLabel= Label1D; % where 0 is non-target (good image), 1 is target (bad image).

  NonTargetImagePredictedLabel = (Label1D+(-1)) * -1; % Convert the label to Binary style, for plotConfusion. Where 1) -1 is bad, 0 is good, 2) then * -1 is applied, flipping it to 1 is bad, 0 is good.

  Output = [NonTargetImagePredictedLabel TargetImagePredictedLabel];

%------------- END OF CODE --------------
end
