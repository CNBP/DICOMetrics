
% =========================================================================
% This function is part of the software release, "Bivariate and
% Spatial-Oriented Correlation Models of Natural Images".
%
% Author: Che-Chun Su (ccsu@utexas.edu)
% =========================================================================

function [ coeff_DN ] = PerformDivisiveNormalization ( coeff , param )

% This function takes the multi-scale, multi-orientation sub-band responses
% as input and performs divisive normalization.
%
% Input:
%       - coeff: sub-band responses, an S-by-O cell, where S is the number
%       of scales and O is the number of orientations
%
%       - param.X:
%           - scale_num: number of scales
%           - ort_num: number of orientations
%           - s_nbr_num: number of spatial neighbors on each side, so the
%           window size is 2*s_nbr_num+1.
%           - sat_const: saturation constant in the divisive normalization
% Output:
%       - coeff_DN: sub-band responses after divisive normalization, an
%       S-by-O cell, where S is the number of scales and O is the number of
%       orientations
%   

% create the mask. ----------
mask_size = 2*param.s_nbr_num+1;

% create the Gaussian weighting function. ---
gau_weighting = fspecial ( 'gaussian' , mask_size , mask_size/2 );
% ---

dn_mask_iso = gau_weighting;
dn_mask_iso(param.s_nbr_num+1,param.s_nbr_num+1) = 0; % not including the current coefficient itself
dn_mask_iso = dn_mask_iso / sum(dn_mask_iso(:));
% ----------

coeff_DN = cell ( param.scl_num , param.ort_num );
for scl = 1:param.scl_num
    for ort = 1:param.ort_num
        
        coeff_temp = coeff{scl,ort};
        
        coeff_temp_mean = imfilter ( coeff_temp , dn_mask_iso , 'symmetric' );
        coeff_temp_sqr  = imfilter ( (coeff_temp - coeff_temp_mean).^2 , dn_mask_iso , 'symmetric' );        
        coeff_DN{scl,ort} = (coeff_temp - coeff_temp_mean) ./ sqrt ( param.sat_const + coeff_temp_sqr );
                
    end
end

