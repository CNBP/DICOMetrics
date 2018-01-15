function export_figs(ext)
% The function converts all '.fig' files in the current folder to image
% files whose type is specified by the input var 'ext'.
%
% INPUT
%   ext = char string indicating the type of the output images (type "doc
%         saveas" to obtain a list of possible formats)
%
%
%s Other m-files required: 	none
% Subfunctions: 				    none
% MAT-files required: 			none
%
% See also: OTHER_FUNCTION_NAME1,  OTHER_FUNCTION_NAME2

% Author: Lorenzo Luini, slightly adapted by Yang Ding
% based entirely from: Fig converter at https://www.mathworks.com/matlabcentral/fileexchange/16906-convert-fig-files-to-images
% All works sponsored by Dr. Gregory Lodygensky and the Canadian Neonatal Brain Platform
% Saint. Justine Hospital, Montreal, Quebec,
% email address: it@cnbp.ca
% Website: http://cnbp.ca
% By: L.Luini
% Release(dd/mm/yyyy): 16/10/2007
% Creation: 2018-01-15T18:27:00.324Z; Last revision:

%------------- BEGIN CODE --------------




% list figures in the current folder
w=dir('*.fig');

% convert all figures to the specified format
for i=1:length(w)
    filename=char(w(i).name);
    target_name=filename(1:end-4);

    % load file as image
    uiopen(filename,1);

    % save in new format
    saveas(gcf,target_name,ext);

    close all;
%------------- END OF CODE --------------
end
