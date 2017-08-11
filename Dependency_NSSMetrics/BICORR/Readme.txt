====== Software Release of Bivariate and Spatial-Oriented Correlation Models of Natural Images. ======

Author: Che-Chun Su

The author is with the Laboratory for Image and Video Engineering (LIVE), Department of Electrical and 
Computer Engineering, The University of Texas at Austin, Austin, TX, USA.

Please kindly report any suggestions or corrections to the author via e-mail: ccsu@utexas.edu

----------

This is a demonstration of bivariate and spatial-oriented correlation models of natural images,
which are described in:

[1] Che-Chun Su, Lawrence K. Cormack, and Alan C. Bovik, "Closed-Form Correlation Model of Oriented 
Bandpass Natural Images," IEEE Signal Processing Letters, to appear, 2014.

[2] Che-Chun Su, Lawrence K. Cormack, and Alan C. Bovik, "Bivariate Statistical Modeling of Color and 
Range in Natural Scenes," in Proceedings of SPIE, Human Vision and Electronic Imaging XIX, vol. 9014, 
Feb. 2014. 

You can change the code in this software release as you like and use it anywhere, 
but please refer to its original source, i.e., cite our papers [1] and [2], and our webpage [3].

[3] Che-Chun Su, "Software Release: Bivariate and Spatial-Oriented Correlation Models of Natural 
Images," http://live.ece.utexas.edu/research/3dnss/bicorr_release.zip

----------

Input: An image

Output: Two sets of model parameters, one for the bivariate generalized Gaussian distribution (GGD) 
and the other for the exponentiated cosine function, at multi-scale, multi-orientation sub-bands.

Usage:
    - This software release runs on MATLAB.
    - 1. Load the image, for example:
        >> img = imread ( 'test_img.jpg' );
    - 2. Obtain the model parameters:
        >> [ bggd , corr ] = ExtractBiCorrNSSFeature ( img );

Dependencies:
    - Steerable Pyramid Tools, which can be downloaded from: http://www.cns.nyu.edu/~eero/steerpyr/
    - MATLAB Image Processing Toolbox
    - MATLAB Statistics Toolbox

----------

Copyright Notice

------ COPYRIGHT NOTICE STARTS WITH THIS LINE ------

Copyright (c) 2014 The University of Texas at Austin
All rights reserved.

Permission is hereby granted, without written agreement and without license or royalty fees, to use, 
copy, modify, and distribute this code (the source files) and its documentation for any purpose, 
provided that the copyright notice in its entirety appear in all copies of this code, and the 
original source of this code, Laboratory for Image and Video Engineering 
(LIVE, http://live.ece.utexas.edu) and Center for Perceptual Systems (CPS, http://www.cps.utexas.edu) 
at The University of Texas at Austin (UT Austin, http://www.utexas.edu), is acknowledged in any 
publication that reports research using this code. The research is to be cited in the bibliography as:

[1] Che-Chun Su, Lawrence K. Cormack, and Alan C. Bovik, "Closed-Form Correlation Model of Oriented
Bandpass Natural Images," IEEE Signal Processing Letters, to appear, 2014.

[2] Che-Chun Su, Lawrence K. Cormack, and Alan C. Bovik, "Bivariate Statistical Modeling of Color and
Range in Natural Scenes," in Proceedings of SPIE, Human Vision and Electronic Imaging XIX, vol. 9014,
Feb. 2014.

[3] Che-Chun Su, "Software Release: Bivariate and Spatial-Oriented Correlation Models of Natural 
Images," http://live.ece.utexas.edu/research/3dnss/bicorr_release.zip

IN NO EVENT SHALL THE UNIVERSITY OF TEXAS AT AUSTIN BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, 
SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OF THIS DATABASE AND ITS 
DOCUMENTATION, EVEN IF THE UNIVERSITY OF TEXAS AT AUSTIN HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH 
DAMAGE.

THE UNIVERSITY OF TEXAS AT AUSTIN SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED 
TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE SOFTWARE 
RELEASE PROVIDED HEREUNDER IS ON AN "AS IS" BASIS, AND THE UNIVERSITY OF TEXAS AT AUSTIN HAS NO 
OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.

------ COPYRIGHT NOTICE ENDS WITH THIS LINE ------

