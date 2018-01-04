
% =========================================================================
% This function is part of the software release, "Bivariate and
% Spatial-Oriented Correlation Models of Natural Images".
%
% Author: Che-Chun Su (ccsu@utexas.edu)
% =========================================================================

function [ amplitude , gamma , offset , fitted ] = FitExponentiatedSineFunction_FixedPeriodPhase ( x , y , period , phase )

% This function fits the data to a general form of an exponentiated sine
% model and finds the three corresponding parameters, amplitude, gamma, and
% offset. Note that the exponentiated cosine function can be derived with a
% fixed phase = pi/2.

exp_sine_func = @(b,x) b(1) * ( ( 1 + sin ( 2*pi*x/period + phase ) ) / 2 ).^b(2) + b(3);
% b(1): amplitude
% b(2): gamma
% b(3): offset

% initialize parameters ----------
beta(1) = max(y) - min(y);
beta(2) = 1;
beta(3) = 0;
% ----------

opt = statset ( 'FunValCheck' , 'off' );
beta_fitted = nlinfit ( x , y , exp_sine_func , beta , opt );

amplitude = beta_fitted(1);
gamma     = beta_fitted(2);
offset    = beta_fitted(3);
fitted = exp_sine_func ( beta_fitted , x );
