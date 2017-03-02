%--------------------------------------
%   LOCAL STATISTICS TOOLBOX
%   Author: Santiago Aja Fernandez
%   www.lpi.tel.uva.es/~santi
%   LOCAL STATISTICS TOOLBOX 
%
% FUNCTIONS :
%
%    STATISTICS
%
% 	- MODA   Mode of a distribution
%	- ARGMAX calculates position of the maximum value of matrix V
%	- ARGMIN calculates position of the minimum value of matrix V
%	- DRAW_HIST estimates and draws histogram of data
%	- Random k data generator
%
%    2D LOCAL OPERATORS
%
%	- LOCALMEAN local mean of 2D image
%	- VARLOCAL local variance of 2D image
%	- CVLOCAL   Local Square Coefficient of variation
%	- LOCALMAD local Median Absolute Deviation (MAD)
%
%    2D LOCAL OPERATORS + MASK
%
%	- LOCALMEAN_MASK local mean of 2D image (with mask)
%	- VARLOCAL_MASK local variance of 2D image (with mask)
%
%   3D LOCAL OPERATORS (OR 2D+t)
%
%	- LOCALMEAN3D_MASK local mean of 3D image
%	- VARLOCAL3D_MASK local variance of 3D image
%	- LOCALMEAN3D_MASK local mean of 2D image (with mask)
%	- VARLOCAL3D_MASK local variance of 2D image (with mask)
%
%   FILTERING
%
%	- WIENERC Perform 2-D adaptive noise-removal filtering.
