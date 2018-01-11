function Output = LiveNIQE(Image)
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
% Creation: @timestamp@; Last revision:

%------------- BEGIN CODE --------------

    %Dependency Clearing:
    

    %Get and visit the current path to ensure no svm-predict conflict.
    scriptName = mfilename('fullpath');
    [currentpath, filename, fileextension]= fileparts(scriptName);
    cd(currentpath)
    load modelparameters.mat

    blocksizerow    = 96;
    blocksizecol    = 96;
    blockrowoverlap = 0;
    blockcoloverlap = 0;


    % Final return
    Output = computequality(Image,blocksizerow,blocksizecol,blockrowoverlap,blockcoloverlap, ...
        mu_prisparam,cov_prisparam)

end
%------------- END OF CODE --------------
