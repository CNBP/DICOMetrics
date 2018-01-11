/*
% -----------COPYRIGHT NOTICE STARTS WITH THIS LINE------------
% Copyright (c) 2003 The University of Texas at Austin
% All rights reserved.
% 
% Permission is hereby granted, without written agreement and without license or royalty fees, to use, copy, 
% modify, and distribute this code (the source files) and its documentation for
% any purpose, provided that the copyright notice in its entirety appear in all copies of this code, and the 
% original source of this code, Laboratory for Image and Video Engineering (LIVE, http://live.ece.utexas.edu)
% and Center for Perceptual Systems (CPS, http://www.cps.utexas.edu) at the University of Texas at Austin (UT Austin, 
% http://www.utexas.edu), is acknowledged in any publication that reports research using this code. The research
% is to be cited in the bibliography as:
% 
% H. R. Sheikh,  A. C. Bovik and L. Cormack, "No-Reference Quality
% Assessment using Natural Scene Statistics: JPEG2000"., IEEE Transactions on Image Processing, (to appear).
% 
% IN NO EVENT SHALL THE UNIVERSITY OF TEXAS AT AUSTIN BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, 
% OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OF THIS DATABASE AND ITS DOCUMENTATION, EVEN IF THE UNIVERSITY OF TEXAS
% AT AUSTIN HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
% 
% THE UNIVERSITY OF TEXAS AT AUSTIN SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
% WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE DATABASE PROVIDED HEREUNDER IS ON AN "AS IS" BASIS,
% AND THE UNIVERSITY OF TEXAS AT AUSTIN HAS NO OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
% 
% -----------COPYRIGHT NOTICE ENDS WITH THIS LINE------------
*/

// #define V4_COMPAT
#include <mex.h>
// #include <matrix.h>  /* Matlab matrices */

#include <stddef.h>  /* NULL */
#include <math.h>  /* ceil */

#define notDblMtx(it) (!mxIsNumeric(it) || !mxIsDouble(it) || mxIsSparse(it) || mxIsComplex(it))

#define PAD 0.49999 /* A hair below 1/2, to avoid roundoff errors */
#define MAXBINS 4000

// function h2d=hist2d(xvar, yvar, Nbins, xmin, xmax, ymin, ymax);

void mexFunction(int nlhs,	     /* Num return vals on lhs */
		 mxArray *plhs[],    /* Matrices on lhs      */
		 int nrhs,	     /* Num args on rhs    */
		 const mxArray *prhs[]     /* Matrices on rhs */
		 )
  {
  register double temp;
  int size;
  register int i, valxbin, valybin;
  register double *im, xbinsize, ybinsize;
  register double *hist;
  double *bincenters;
  mxArray *arg;
  double *xvar, *yvar, xmin, xmax, ymin, ymax;
  int Nbins;
  double *mxMat;
  int outsize=0;
  int size2=0;

  if (nrhs != 7 ) mexErrMsgTxt("syntax: h2d=hist2d(xvar, yvar, Nbins, xmin, xmax, ymin, ymax);");

  /* ARG 1: MATRIX  */
  arg = prhs[0];
  if notDblMtx(arg) mexErrMsgTxt("MTX arg must be a real non-sparse matrix.");
  xvar = (mxGetPr(arg));
  size = (int) mxGetM(arg) * mxGetN(arg);

  arg = prhs[1];
  if notDblMtx(arg) mexErrMsgTxt("MTX arg must be a real non-sparse matrix.");
  yvar = mxGetPr(arg);
  size2 = (int) mxGetM(arg) * mxGetN(arg);


  if (size2 != size)
	mexErrMsgTxt("error xvar and yvar have different sizes");

  arg = prhs[2];
  if notDblMtx(arg) mexErrMsgTxt("MTX arg must be a real non-sparse matrix.");
  Nbins = (int)*(mxGetPr(arg));

  arg = prhs[3];
  if notDblMtx(arg) mexErrMsgTxt("MTX arg must be a real non-sparse matrix.");
  xmin = *(mxGetPr(arg));

  arg = prhs[4];
  if notDblMtx(arg) mexErrMsgTxt("MTX arg must be a real non-sparse matrix.");
  xmax = *(mxGetPr(arg));

  arg = prhs[5];
  if notDblMtx(arg) mexErrMsgTxt("MTX arg must be a real non-sparse matrix.");
  ymin = *(mxGetPr(arg));

  arg = prhs[6];
  if notDblMtx(arg) mexErrMsgTxt("MTX arg must be a real non-sparse matrix.");
  ymax = *(mxGetPr(arg));

  if (Nbins < 3)
	mexErrMsgTxt("Nbins should be 3 or larger");

  if (xmax <= xmin)
	mexErrMsgTxt("xmax should be larger than xmin");
	  
  if (ymax <= ymin)
	mexErrMsgTxt("ymax should be larger than ymin");

  
  /*calculate binsizes*/
  xbinsize = ((xmax)-(xmin))/((Nbins)-2); /* two lowest bins*/
  ybinsize = ((ymax)-(ymin))/((Nbins)-2);
  
  if (Nbins > MAXBINS)
      {
      mexPrintf("Nbins: %d,  MAXBINS: %d\n",Nbins,MAXBINS);
      mexErrMsgTxt("Number of bins has exceeded maximum");
      }


  plhs[0] = (mxArray *) mxCreateDoubleMatrix(Nbins,Nbins,mxREAL);
  if (plhs[0] == NULL) mexErrMsgTxt("Error allocating result matrix");
  hist = mxGetPr(plhs[0]);

  for (i=0; i <size; i++)
  {
	  if (xvar[i] < xmin)
		  valxbin = 0;
	  else if (xvar[i] >= xmax)
		  valxbin = Nbins-1;
	  else
		  valxbin=floor((xvar[i]-(xmin))/xbinsize)+1;

	  if (yvar[i] < ymin)
		  valybin = 0;
	  else if (yvar[i] >= ymax)
		  valybin = Nbins-1;
	  else
		  valybin=floor((yvar[i]-(ymin))/ybinsize)+1;

	  hist[valxbin*(Nbins) + valybin]++; /* increment count*/
  }

  return;
  }      

