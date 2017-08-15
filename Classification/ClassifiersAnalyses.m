function Result = ClassifiersAnalyses(InputDataColumns, trueLabels, AlgoChoice, CVFold)
%ClassifiersAnalyses - 	Most of the following code are adapted from the machine learning tutorial that is already available on Matlab's own  tutorial website as shown [here](https://www.mathworks.com/help/stats/examples/classification.html).
%
% Syntax:  Result = function_name(input1,input2,input3)
%
% Inputs:
%    	InputDataColumns 	- this is the main data matrix where the bulk of the data reside
%    	OutputLabels 	    - true label of the the data provided.
%		  Algo                    - Description
% 		CVFold					- Description
% Outputs:
%    	Result.Classifier 				- this is the substitution error and may indicate over fit if the value is too low
%    	Result.ResubError 				- this is the substitution error and may indicate over fit if the value is too low
%    	Result.cvResubError 			- this is the more generalizable substitution error after computing cross validation
%    	Result.cvClassifier 			- this is the substitution error and may indicate over fit if the value is too low
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
% 2017-03; Last revision: 2017-08-15 09:09:18 Eastern Time

%------------- BEGIN CODE --------------

	%TODO: Check if InputDataColumnsLabels has the same number of elements as columsn of InputDataColumsn.
  if (isempty(InputDataColumns) || isempty(trueLabels) )
    error('Fatal Error: argument EMPTY!');
    return;
  elseif (size(InputDataColumns,1) ~= size(trueLabels,1))
    error('Fatal Error:Input rows do not match and cannot process. Make sure labels and metrics have the SAME number of rows!');
    return;
  elseif (size(trueLabels,2) == 2)
    error('Fatal Error:Input trueLabels must only have two classes!');
    return;
  end

    Result = struct;
	% Establish cross validations. Default Set to 10.
	rng(0,'twister');
	cp = cvpartition(trueLabels,'KFold',CVFold);

	switch AlgoChoice
		case 1 % Linear Discriminant Analysis (LDA). Using Pseudo in case of 0 in data columns.
			lda = fitcdiscr(InputDataColumns,trueLabels, 'DiscrimType','pseudoLinear');
			ldaClass = resubPredict(lda);
			Result.ResubError = resubLoss(lda);
			Result.Classifier = lda;
			% Eg Output: Resub 0.3039

			% LDA CV:
			cvlda = crossval(lda,'CVPartition',cp);
			Result.cvResubError = kfoldLoss(cvlda);
			Result.cvClassifier = cvlda;
			% Eg Output: ldaCVErr = 0.3265
			disp('Linear Discriminant Analysis (LDA) Completed');
		case 2 % Quadratic Discriminant Analysis (QDA). Using Pseudo in case of 0 in data columns.
			qda = fitcdiscr(InputDataColumns,trueLabels,'DiscrimType','pseudoQuadratic');
			Result.ResubError = resubLoss(qda);
			Result.Classifier = qda;
			% Eg Output: > qdaResubErr = 0.3706

			% QDA CV:
			cvqda = crossval(qda,'CVPartition',cp);
			Result.cvResubError = kfoldLoss(cvqda);
			Result.cvClassifier = cvqda;
			% Eg Output: > qdaCVErr = 0.4480
			disp('Quadratic Discriminant Analysis (QDA) Completed');
		case 3 % Naive Bay Classifer (NBC):
			nbGau = fitcnb(InputDataColumns,trueLabels);
			Result.ResubError = resubLoss(nbGau);
			% Eg Output: 	> 0.7353
			Result.Classifier = nbGau;

			nbGauCV = crossval(nbGau, 'CVPartition',cp);
			Result.cvClassifier = nbGauCV;
			Result.cvResubError = kfoldLoss(nbGauCV);
			% Eg Output: > 0.7353
			disp('Naive Bay Classifier Completed');
		case 4 % NBC with Kernal Distribution:
			nbKD = fitcnb(InputDataColumns, trueLabels, 'DistributionNames','kernel', 'Kernel','box');
			Result.ResubError = resubLoss(nbKD);
			% Eg Output: 		>0.6157
			Result.Classifier = nbKD;

			nbKDCV = crossval(nbKD, 'CVPartition',cp);
			Result.cvClassifier = nbKDCV;
			Result.cvResubError = kfoldLoss(nbKDCV);
			% Eg Output: 		>0.6355
			disp('Naive Bay Classifier with Kernal Distribution is Completed');
		case 5 %Decision Tree:
			t = fitctree(InputDataColumns, trueLabels);
			Result.Classifier = t;
			Result.ResubError = resubLoss(t);
			% Eg Output: 	0.0843

			%cvt = crossval(t,'CVPartition',cp);
			%cvClassifer = cvt;
			%Result.cvResubError = kfoldLoss(cvt)
			% Eg Output: 	0.4098

			resubcost = resubLoss(t,'Subtrees','all');
			[cost,secost,ntermnodes,bestlevel] = cvloss(t,'Subtrees','all');
			plot(ntermnodes,cost,'b-', ntermnodes,resubcost,'r--');
			figure(gcf);
			xlabel('Number of terminal nodes');
			ylabel('Cost (misclassification error)');
			legend('Cross-validation','Resubstitution');
			[mincost,minloc] = min(cost);
			cutoff = mincost + secost(minloc);
			hold on
			plot([0 20], [cutoff cutoff], 'k:');
			plot(ntermnodes(bestlevel+1), cost(bestlevel+1), 'mo');
			legend('Cross-validation','Resubstitution','Min + 1 std. err.','Best choice');
			hold off
			pt = prune(t,'Level',bestlevel);
			Result.cvClassifier = pt;
			view(pt,'Mode','graph');

			Result.cvResubError = cost(bestlevel+1);

			disp('Pruned Decision Tree is Completed');
		case 6 %Rusboosted cvClassifier
      RUSBoostClassifer(InputDataColumns, trueLabels, 50)
		otherwise
			Result = [];
			return
	end

%------------- END OF CODE --------------
end
