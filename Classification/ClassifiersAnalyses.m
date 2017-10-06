function Result = ClassifiersAnalyses(InputDataColumns, trueLabels, AlgoChoice, CVFold)
%ClassifiersAnalyses - 	Most of the following code are adapted from the machine learning tutorial that is already available on Matlab's own  tutorial website as shown [here](https://www.mathworks.com/help/stats/examples/classification.html).
%
% Syntax:  Result = function_name(input1,input2,input3)
%
% Inputs:
%    	InputDataColumns 	- this is the main data matrix where the bulk of the data reside
%    	trueLabels 	    - true label of the the data provided. 0 for bad images 1 for good images.
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
            Result = SingleModelClassifier(lda, InputDataColumns, trueLabels, 'pLDA')
			% Eg Output: ldaCVErr = 0.3265
			disp('Linear Discriminant Analysis (LDA) Completed');
		case 2 % Quadratic Discriminant Analysis (QDA). Using Pseudo in case of 0 in data columns.
			qda = fitcdiscr(InputDataColumns,trueLabels,'DiscrimType','pseudoQuadratic');
			Result = SingleModelClassifier(qda, InputDataColumns, trueLabels, 'pQDA')
			% Eg Output: > qdaCVErr = 0.4480
			disp('Quadratic Discriminant Analysis (QDA) Completed');
		case 3 % Naive Bay Classifier (NBC):
      try
        nbGau = fitcnb(InputDataColumns,trueLabels);
        Result = SingleModelClassifier(nbGau, InputDataColumns, trueLabels, 'NBC')
        disp('Naive Bay Classifier Completed');
  			% Eg Output: > 0.7353
      catch
        warning('Warning: Problem forming Naive Bay Classifier. Assigning a value of []');
        disp('Naive Bay Classifier FAILED');
        Result = [];
      end

		case 4 % NBC with Kernal Distribution:
      try
        nbKD = fitcnb(InputDataColumns, trueLabels, 'DistributionNames','kernel', 'Kernel','box');
        Result = SingleModelClassifier(nbKD, InputDataColumns, trueLabels, 'NBC-BoxKernel')
        % Eg Output: 		>0.6355
        disp('Naive Bay Classifier with Box Kernal Distribution is Completed');
      catch
        warning('Warning: Problem forming Naive Bay Classifier with Kernal Distribution. Assigning a value of []');
        disp('Naive Bay Classifier with Box Kernal Distribution FAILED');
        Result = [];
      end

		case 5 %Decision Tree:
			t = fitctree(InputDataColumns, trueLabels);
			Result = SingleModelClassifier(t, InputDataColumns, trueLabels, 'DecisionTree')
      disp('Decision Tree is Completed');
    case 6 %Rusboosted cvClassifier
      Result = RUSBoostClassifier(InputDataColumns, trueLabels, 50)
      disp('RusBoosted Tree Ensemble is Completed');
    case 7 %Rusboosted cvClassifier
      Result = RUSBoostClassifier(InputDataColumns, trueLabels, 50)
      disp('RusBoosted Tree Ensemble is Completed');
    case 8 %Rusbootted
      Result = RUSBoostClassifier(InputDataColumns, trueLabels, 50)
      disp('RusBoosted Tree Ensemble is Completed');
    case 99999999
      %t = fitctree(InputDataColumns, trueLabels);
			%Result.ResubError = resubLoss(t);
			%% Eg Output: 	0.0843
%
			%%cvt = crossval(t,'CVPartition',cp);
			%%cvClassifier = cvt;
			%%Result.cvResubError = kfoldLoss(cvt)
			%% Eg Output: 	0.4098
%
			%resubcost = resubLoss(t,'Subtrees','all');
			%[cost,secost,ntermnodes,bestlevel] = cvloss(t,'Subtrees','all');
			%plot(ntermnodes,cost,'b-', ntermnodes,resubcost,'r--');
			%figure(gcf);
			%xlabel('Number of terminal nodes');
			%ylabel('Cost (misclassification error)');
			%legend('Cross-validation','Resubstitution');
			%[mincost,minloc] = min(cost);
			%cutoff = mincost + secost(minloc);
			%hold on
			%plot([0 20], [cutoff cutoff], 'k:');
			%plot(ntermnodes(bestlevel+1), cost(bestlevel+1), 'mo');
			%legend('Cross-validation','Resubstitution','Min + 1 std. err.','Best choice');
			%hold off
			%pt = prune(t,'Level',bestlevel);
			%Result.cvClassifier = pt;
			%view(pt,'Mode','graph');
%
			%Result.cvResubError = cost(bestlevel+1);

		otherwise
			Result = [];
			return
	end

%------------- END OF CODE --------------
end
