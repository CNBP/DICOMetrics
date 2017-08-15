
% =========================================================================
% This function is part of the software release, "Bivariate and
% Spatial-Oriented Correlation Models of Natural Images".
%
% Author: Che-Chun Su (ccsu@utexas.edu)
% =========================================================================

function [ subband ] = ExtractSPyr ( img , param )

% This function takes an image as input and performs the steerable pyramid
% decomposition to obtain the multi-scale, multi-orientation sub-band
% responses.

[ pyr , ind ] = buildSFpyr ( img , param.scl_num , param.ort_num-1 );
res = ind;
res(:,3) = ind(:,1).*ind(:,2);

subband = cell ( param.scl_num , param.ort_num );
for scl = 1:param.scl_num
    for ort = 1:param.ort_num
        
        idx_temp = (scl-1)*param.ort_num + ort;
        pyr_beg = sum ( res(1:idx_temp,3) ) + 1;
        pyr_end = sum ( res(1:(idx_temp+1),3) );
        
        subband{scl,ort} = pyr(pyr_beg:pyr_end);
        subband{scl,ort} = reshape ( subband{scl,ort} , [ res(idx_temp+1,1) res(idx_temp+1,2) ] );
        
    end
end

