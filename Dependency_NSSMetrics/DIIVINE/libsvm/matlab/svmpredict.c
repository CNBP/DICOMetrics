#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../svm.h"

#include "mex.h"
#include "svm_model_matlab.h"

#ifdef MX_API_VER
#if MX_API_VER < 0x07030000
typedef int mwIndex;
#endif
#endif

#define CMD_LEN 2048

void read_sparse_instance(const mxArray *prhs, int index, struct svm_node *x)
{
	int i, j, low, high;
	mwIndex *ir, *jc;
	double *samples;

	ir = mxGetIr(prhs);
	jc = mxGetJc(prhs);
	samples = mxGetPr(prhs);

	// each column is one instance
	j = 0;
	low = (int)jc[index], high = (int)jc[index+1];
	for(i=low;i<high;i++)
	{
		x[j].index = (int)ir[i] + 1;
		x[j].value = samples[i];
		j++;
	}
	x[j].index = -1;
}

static void fake_answer(int nlhs, mxArray *plhs[])
{
	plhs[0] = mxCreateDoubleMatrix(0, 0, mxREAL);
    if(nlhs>0) {
        plhs[1] = mxCreateDoubleMatrix(0, 0, mxREAL);
    }
    if(nlhs>1) {
        plhs[2] = mxCreateDoubleMatrix(0, 0, mxREAL);
    }
}

// void predict(mxArray *plhs[], const mxArray *prhs[], struct svm_model *model, const int predict_probability)
void predict(mxArray **pppredictLabels, mxArray **ppOutputMat,const mxArray *instanceMatrix, const struct svm_model *model,bool probOutput)
{
	int feature_number, testing_instance_number;
	int instance_index;
	double *ptr_instance, *ptr_predict_label;
	double *ptr_output;
//    double *ptr;
	struct svm_node *x;

	int svm_type=svm_get_svm_type(model);
	int nr_class=svm_get_nr_class(model);
	double *prob_estimates=NULL;

	feature_number = (int)mxGetN(instanceMatrix);
	testing_instance_number = (int)mxGetM(instanceMatrix);

	ptr_instance = mxGetPr(instanceMatrix);



	if(probOutput)
	{
		if(svm_type==NU_SVR || svm_type==EPSILON_SVR) {
			//mexPrintf("Prob. model for test data: target value = predicted value + z,\nz: Laplace distribution e^(-|z|/sigma)/(2sigma),sigma=%g\n",svm_get_svr_probability(model));
        } else {
			prob_estimates = (double *) malloc(nr_class*sizeof(double));
        }
	}

	*pppredictLabels = mxCreateDoubleMatrix(testing_instance_number, 1, mxREAL);
    if(ppOutputMat)
    {
        if(probOutput)
        {
            // prob estimates are in plhs[1]
            if(svm_type==C_SVC || svm_type==NU_SVC) {
                *ppOutputMat = mxCreateDoubleMatrix(testing_instance_number, nr_class, mxREAL);
            } else {
                *ppOutputMat = mxCreateDoubleMatrix(0, 0, mxREAL);
            }
        }
        else
        {
            // decision values are in plhs[1]
            if(svm_type == ONE_CLASS ||
               svm_type == EPSILON_SVR ||
               svm_type == NU_SVR ||
               nr_class == 1) // if only one class in training data, decision values are still returned.
            {
                *ppOutputMat = mxCreateDoubleMatrix(testing_instance_number, 1, mxREAL);
            } else {
                *ppOutputMat = mxCreateDoubleMatrix(testing_instance_number, nr_class*(nr_class-1)/2, mxREAL);
            }
        }
    }
	ptr_predict_label = mxGetPr(*pppredictLabels);
    ptr_output =NULL;
    if(ppOutputMat) {
    	ptr_output = mxGetPr(*ppOutputMat);
    }

	x = (struct svm_node*)malloc((feature_number+1)*sizeof(struct svm_node) );
    
	for(instance_index=0;instance_index<testing_instance_number;instance_index++)
	{
		int i;
		double predict_label;

		if(mxIsSparse(instanceMatrix) && model->param.kernel_type != PRECOMPUTED) // instanceMatrix^T is still sparse
        {
			read_sparse_instance(instanceMatrix, instance_index, x);
        } else {
			for(i=0;i<feature_number;i++)
			{
				x[i].index = i+1;
				x[i].value = ptr_instance[testing_instance_number*i+instance_index];
			}
			x[feature_number].index = -1;
		}

		if(probOutput)
        {
			if(svm_type==C_SVC || svm_type==NU_SVC)
			{
				predict_label = svm_predict_probability(model, x, prob_estimates);
				ptr_predict_label[instance_index] = predict_label;
                if(ptr_output) {
                    for(i=0;i<nr_class;i++) {
                        ptr_output[instance_index + i * testing_instance_number] = prob_estimates[i];
                    }
                }
			} else {
				predict_label = svm_predict(model,x);
				ptr_predict_label[instance_index] = predict_label;
			}
		} else {
			if(svm_type == ONE_CLASS ||
			   svm_type == EPSILON_SVR ||
			   svm_type == NU_SVR)
			{
				double res;
				predict_label = svm_predict_values(model, x, &res);
                if(ptr_output) ptr_output[instance_index] = res;
			} else {
				double *dec_values = (double *) malloc(sizeof(double) * nr_class*(nr_class-1)/2);
				predict_label = svm_predict_values(model, x, dec_values);
                if(ptr_output) {
                    if(nr_class == 1)  {
                        ptr_output[instance_index] = 1;
                    } else {
                        for(i=0;i<(nr_class*(nr_class-1))/2;i++) {
                            ptr_output[instance_index + i * testing_instance_number] = dec_values[i];
                        }
                    }
                }
				free(dec_values);
			}
			ptr_predict_label[instance_index] = predict_label;
		}

	}

	free(x);
	if(prob_estimates != NULL)
		free(prob_estimates);
}

void exit_with_help()
{
	mexPrintf(
		"Usage: [predicted_label, decision_values,prob_estimates] = svmpredict(instanceMatrix, model, options)\n"
		"Parameters:\n"
		"  instanceMatrix: matrix of instances to test.\n"
		"  model: SVM model structure from svmtrain or libsvmreadmodel.\n"
		"  options: structure \n"
		"      output: {'probability', 'decision'} \n"
		"         default: 'decision'\n"
		"Returns:\n"
		"  predicted_label: SVM prediction output vector.\n"
		"  prob_estimates: one-class SVM not supported yet\n"
        "    If selected, probability estimate vector.\n"
	);
}

void mexFunction( int nlhs, mxArray *plhs[],
		 int nrhs, const mxArray *prhs[] )
{
	int probEstimateFlag = 0;
	int output2 = 0;
	struct svm_model *model;
    mxArray * instanceMatrix;
    mxArray ** predictLabels;
    mxArray ** outputMat;
    const char * error_msg;    

	if(nrhs< 2 || nrhs>3)
	{
		exit_with_help();
		fake_answer(nlhs,plhs);
		return;
	}

	if(nlhs <1 || nlhs >2)
	{
		exit_with_help();
		fake_answer(nlhs,plhs);
		return;
	}

	if(!mxIsDouble(prhs[0])) {
		mexPrintf("Error: instance matrix must be double\n");
		fake_answer(nlhs,plhs);
		return;
	}

    if(!mxIsStruct(prhs[1])) {
		mexPrintf("Error: model must be a struct\n");
		fake_answer(nlhs,plhs);
		return;
	}
	if(nrhs==3 && !mxIsStruct(prhs[2]))
	{
        mexPrintf("Error: options must be a struct\n");
		fake_answer(nlhs,plhs);
		return;
	}
	if(nrhs==3 && mxGetField(prhs[2],0,"output")!=NULL )
	{
        mxArray * field=mxGetField(prhs[2],0,"output");
        if(field) 
        {
            char value[1024];
            int rtn;
            rtn=mxGetString(field, value, 1024);
            if(0==strcmp(value,"probability")) {
               probEstimateFlag=1;     
            } else if(0==strcmp(value,"decision")) {
               probEstimateFlag=0;     
            } else {
                mexPrintf("Error: invalid output option.  'probability' or 'decision'\n");
                fake_answer(nlhs,plhs);
                return;
            }
        }
    }
    // preprocess instance matrix, make full transpose

    instanceMatrix=(mxArray*)prhs[0];
    // transpose instance matrix if sparse
    //mexPrintf("Input parsed\n");

	if(mxIsSparse(instanceMatrix))
	{
        mxArray * instanceMatrix_t;
        //mexPrintf("sparse input\n");
		if(model->param.kernel_type == PRECOMPUTED)
		{
			// precomputed kernel requires dense matrix, so we make one
			mxArray *temp;
			temp = mxDuplicateArray(instanceMatrix);
			if(mexCallMATLAB(1, &instanceMatrix_t, 1, &temp, "full"))
			{
				mexPrintf("Error: cannot full testing instance matrix\n");
				fake_answer(nlhs,plhs);
                mxDestroyArray(temp);
				return;
			}
			mxDestroyArray(temp);
		}
		else
		{
			mxArray *temp;
			temp = mxDuplicateArray(instanceMatrix);
			if(mexCallMATLAB(1, &instanceMatrix_t, 1, &temp, "transpose"))
			{
				mexPrintf("Error: cannot transpose testing instance matrix\n");
				fake_answer(nlhs,plhs);
                mxDestroyArray(temp);
				return;
			}
		}
        instanceMatrix=instanceMatrix_t;
	}


    model = matlab_matrix_to_model(prhs[1], &error_msg);
	if (model == NULL)
	{
        mexPrintf("Error: can't read model: %s\n", error_msg);
        fake_answer(nlhs,plhs);
        return;
    }

    // optional output
    output2 = nlhs>1;

    if(probEstimateFlag)
    {
        if(svm_check_probability_model(model)==0)
        {
            mexPrintf("Model does not support probabiliy estimates\n");
//             plhs[1] = mxCreateDoubleMatrix(0, 0, mxREAL);
            probEstimateFlag=0;
        }
    }


    predictLabels=&plhs[0];
    outputMat=NULL;
    if(nlhs > 1) {
       outputMat=&plhs[1];
    }

	predict(predictLabels, outputMat, instanceMatrix, model,probEstimateFlag);
		// destroy model
    svm_free_and_destroy_model(&model);
    if(instanceMatrix!=prhs[0]) // destroy if created instanceMatrix transpose
    {
        mxDestroyArray(instanceMatrix);
    }

	return;
}
