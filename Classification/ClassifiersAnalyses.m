function [ResubError,cvResubError] = ClassifiersAnalyses(InputDataColumns, OutputOutputLabelss, InputDataColumnsLabels, Algo, CVFold)
%ClassifiersAnalyses - 	Most of the following code are adapted from the machine learning tutorial that is already available on Matlab's own  tutorial website as shown [here](https://www.mathworks.com/help/stats/examples/classification.html). 
%Optional file header info (to give more details about the function than in the H1 line)
%Optional file header info (to give more details about the function than in the H1 line)
%Optional file header info (to give more details about the function than in the H1 line)
%
% Syntax:  [ResubError,cvResubError] = function_name(input1,input2,input3)
%
% Inputs:
%    	InputDataColumns 		- this is the main data matrix where the bulk of the data reside
%    	OutputOutputLabelss 	- Description
% 		InputDataColumnsLabels  - Description
%		Algo                    - Description
% 		CVFold					- Description
% Outputs:
%    	ResubError 				- this is the substitution error and may indicate over fit if the value is too low
%    	cvResubError 			- this is the more generalizable substitution error after computing cross validation
%
% Example: 
%    	Line 1 of example
%    	Line 2 of example
%    	Line 3 of example
%
% Other m-files required: 			none
% Subfunctions: 					none
% MAT-files required: 				none
%
% See also: OTHER_FUNCTION_NAME1,  OTHER_FUNCTION_NAME2

% Author: Yang Ding
% All works sponsored by Dr. Gregory Lodygensky and the Canadian Neonatal Brain Platform
% Saint. Justine Hospital, Montreal, Quebec, 
% email address: it@cnbp.ca
% Website: http://cnbp.ca
% 2017-03; Last revision: 10:30 AM 2017-03-02

%------------- BEGIN CODE --------------
	
	%Todo: Check if InputDataColumnsLabels has the same number of elements as columsn of InputDataColumsn. 
		
	
	% Establish cross validations. Default Set to 10.  
	rng(0,'twister');
	cp = cvpartition(OutputLabels,'KFold',CVFold)
		
	switch AlgoChoice
		case 1 % Linear Discriminant Analysis (LDA). Using Pseudo in case of 0 in data columns. 
			lda = fitcdiscr(InputDataColumns,OutputOutputLabelss, 'DiscrimType','pseudoLinear');
			ldaClass = resubPredict(lda);
			ResubError = resubLoss(lda)
			
			% Eg Output: Resub 0.3039 
				
			% LDA CV:
			cvlda = crossval(lda,'CVPartition',cp);
			cvResubError = kfoldLoss(cvlda)
			% Eg Output: ldaCVErr = 0.3265
			
		case 2 % Quadratic Discriminant Analysis (QDA). Using Pseudo in case of 0 in data columns. 
			qda = fitcdiscr(InputDataColumns,OutputOutputLabelss,'DiscrimType','pseudoQuadratic');
			ResubError = resubLoss(qda)
			% Eg Output: > qdaResubErr = 0.3706

			% QDA CV:
			cvqda = crossval(qda,'CVPartition',cp);
			cvResubError = kfoldLoss(cvqda)
			% Eg Output: > qdaCVErr = 0.4480
		
		case 3 % Naive Bay Classifer (NBC): 
			nbGau = fitcnb(InputDataColumns,OutputLabels);
			ResubError = resubLoss(nbGau)
			% Eg Output: 	> 0.7353
			
			nbGauCV = crossval(nbGau, 'CVPartition',cp);
			cvResubError = kfoldLoss(nbGauCV)
			% Eg Output: > 0.7353

		case 4 % NBC with Kernal Distribution:
			nbKD = fitcnb(InputDataColumns, OutputLabels, 'DistributionNames','kernel', 'Kernel','box');
			ResubError = resubLoss(nbKD)	
			% Eg Output: 		>0.6157
			
			nbKDCV = crossval(nbKD, 'CVPartition',cp);
			cvResubError = kfoldLoss(nbKDCV)
			% Eg Output: 		>0.6355
	
		case 5 %Decision Tree: 
			t = fitctree(InputDataColumns, OutputLabels,'PredictorNames',InputDataColumnsLabels);
				
			ResubError = resubLoss(t)
			% Eg Output: 	0.0843

			cvt = crossval(t,'CVPartition',cp);
			cvResubError = kfoldLoss(cvt)
			% Eg Output: 	0.4098

			resubcost = resubLoss(t,'Subtrees','all');
			[cost,secost,ntermnodes,bestlevel] = cvloss(t,'Subtrees','all');
			plot(ntermnodes,cost,'b-', ntermnodes,resubcost,'r--')
			figure(gcf);
			xOutputLabels('Number of terminal nodes');
			yOutputLabels('Cost (misclassification error)')
			legend('Cross-validation','Resubstitution')
			[mincost,minloc] = min(cost);
			cutoff = mincost + secost(minloc);
			hold on
			plot([0 20], [cutoff cutoff], 'k:')
			plot(ntermnodes(bestlevel+1), cost(bestlevel+1), 'mo')
			legend('Cross-validation','Resubstitution','Min + 1 std. err.','Best choice')
			hold off
			pt = prune(t,'Level',bestlevel);
			view(pt,'Mode','graph')

			cost(bestlevel+1)

			% Eg Output: 0.4039
		otherwise
			[ResubError,cvResubError] = [];
			return 
	end

%------------- END OF CODE --------------
end 