
% =========================================================================
% This function is part of the software release, "Bivariate and
% Spatial-Oriented Correlation Models of Natural Images".
%
% Author: Che-Chun Su (ccsu@utexas.edu)
% =========================================================================

function [ feature_bggd , feature_corr ] = ExtractBiCorrNSSFeature ( img )

% This function takes an image as input and extracts its bivariate and
% spatial-oriented correlation NSS features as the model parameters of the
% bivariate generalized Gaussian distribution (GGD) and the exponentiated
% cosine function.
%
% Input:
%       - img: an image
% Output:
%       - feature_bggd: bivariate GGD NSS feature, an S-by-O-by-2 array,
%       where S is the number of sub-band scales and O is the number of
%       sub-band orientations, and there are two parameters, alpha and
%       beta, for each sub-band.
%       - feature_corr: spatial-oriented correlation NSS feature, an S-by-3
%       array, where S is the number of sub-band scales, and there are
%       three parameters, amplitude, gamma, and offset for each scale.

if size(img,3) == 3
    param.cform = makecform ( 'srgb2lab' );
    img = applycform ( img , param.cform );
    img = img(:,:,1);
end
img = double(img);

% parameters --------------------------------------------------------------
param.img_h = size ( img , 1 );
param.img_w = size ( img , 2 );

% subband decomposition ------
param.scl_idx = 1:5; % scale index
param.scl_num = length ( param.scl_idx );
param.ort_idx = 1:12; % orientation index
param.ort_num = length ( param.ort_idx );

param.scl_axis = 1:param.scl_num;
param.ort_axis = 0:180/param.ort_num:180;
param.ort_axis = param.ort_axis(1:end-1);
param.ort_axis_fit = 0:180/(10*param.ort_num):param.ort_axis(end);
% ------

% divisive normalization ------
param.s_nbr_num = 4; % number of spatial neighbors on each side, so the window size is 2*s_nbr_num+1
param.sat_const = 0.0001; % saturation constant in the divisive normalization
% ------

param.img_bin_num = 50;
param.img_bin_std_num = 3;

param.sine_fit_period = 180;
param.sine_fit_phase = -pi/2;
% (parameters) ------------------------------------------------------------


% perform steerable pyramid subband decomposition. ------------------------
[ coeff ] = ExtractSPyr ( img , param );
% -------------------------------------------------------------------------


% perform divisive normalization. -----------------------------------------
[ coeff_DN ] = PerformDivisiveNormalization ( coeff , param );
% -------------------------------------------------------------------------


% extract bivariate and correlation NSS features. -------------------------
feature_bggd = zeros ( param.scl_num , param.ort_num , 2 );
feature_corr = zeros ( param.scl_num , 3 );
for scl = 1:param.scl_num
    
    corr_coeff = zeros ( param.ort_num , 1 );
    for ort = 1:param.ort_num
        
        % ---
        fprintf ( 'Extracting bivariate and correlation NSS features ... ( scl = %d / %d , ort = %d / %d )\n' , scl , param.scl_num , ort , param.ort_num );
        % ---
        
        coeff_temp = coeff_DN{scl,ort};
        coeff_temp_1 = coeff_temp(:,1:(end-1)); coeff_temp_1 = coeff_temp_1(:);
        coeff_temp_2 = coeff_temp(:,2:end); coeff_temp_2 = coeff_temp_2(:);
        
        mean_temp = mean ( coeff_temp_1(:) );
        std_temp = std ( coeff_temp_1(:) );
        bin_beg = mean_temp - param.img_bin_std_num*std_temp;
        bin_end = mean_temp + param.img_bin_std_num*std_temp;
        bin_int = (bin_end-bin_beg) / param.img_bin_num;
        bin_image{1} = bin_beg:bin_int:bin_end;
        
        mean_temp = mean ( coeff_temp_2(:) );
        std_temp = std ( coeff_temp_2(:) );
        bin_beg = mean_temp - param.img_bin_std_num*std_temp;
        bin_end = mean_temp + param.img_bin_std_num*std_temp;
        bin_int = (bin_end-bin_beg) / param.img_bin_num;
        bin_image{2} = bin_beg:bin_int:bin_end;
        
        % fit the bivariate generalized Gaussian distribution. ----------
        [ bggd_M , bggd_alpha , bggd_beta , bggd_fitted ] = FitMGGD ( [ coeff_temp_1(:)' ; coeff_temp_2(:)' ] , bin_image );
        % ----------
        
        feature_bggd(scl,ort,:) = [ bggd_alpha ; bggd_beta ];
        
        % compute the correlation coefficient. ----------
        corr_coeff(ort) = corr ( coeff_temp_1(:) , coeff_temp_2(:) );
        % ----------
        
    end
    
    % fit the exponentiated sine model with the fixed period and phase.
    % ----------
    [ amplitude , gamma , offset , corr_fitted ] = FitExponentiatedSineFunction_FixedPeriodPhase ( param.ort_axis , corr_coeff' , param.sine_fit_period , param.sine_fit_phase );
    feature_corr(scl,:) = [ amplitude ; gamma ; offset ];
    % ----------
    
end
% -------------------------------------------------------------------------



