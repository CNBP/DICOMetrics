#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <errno.h>

#include "../svm.h"
#include "mex.h"
#include "svm_model_matlab.h"

#ifdef MX_API_VER
#if MX_API_VER < 0x07030000
typedef int mwIndex;
#endif 
#endif 
#ifndef max
#define max(x,y) (((x)>(y))?(x):(y))
#endif
#ifndef min
#define min(x,y) (((x)<(y))?(x):(y))
#endif

void exit_with_help()
{
	mexPrintf(
	"Usage: [model] = libsvmreadmodel(filename, feature_size);\n"
	);
}

static void fake_answer(mxArray *plhs[])
{
	plhs[0] = mxCreateDoubleMatrix(0, 0, mxREAL);
}

static char *line;
static int max_line_len;

void mexFunction( int nlhs, mxArray *plhs[],
		int nrhs, const mxArray *prhs[] )
{
    struct svm_model *model;
    char filename[1024];
    int nr_feat;
    const char* error_msg;
    
	if(nrhs == 2)
	{
		mxGetString(prhs[0], filename, 1024);

		if(filename == NULL)
		{
			mexPrintf("Error: filename is NULL\n");
            fake_answer(plhs);
			return;
		}
        model = svm_load_model(filename);
		if(model == NULL)
		{
			mexPrintf("Error: cannot read model\n");
            fake_answer(plhs);
			return;
		}        
       
        
        nr_feat = mxGetScalar(prhs[1]);
        //mexPrintf("Feature size:%d\n",nr_feat);
        
        error_msg=model_to_matlab_structure(plhs, nr_feat, model);
        if(error_msg) {
            mexPrintf("%s",error_msg);
        }
        svm_free_and_destroy_model(&model);

	}
	else
	{
		exit_with_help();
		fake_answer(plhs);
		return;
	}
}

