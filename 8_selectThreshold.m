function [bestEpsilon bestF1] = selectThreshold(yval, pval)
%SELECTTHRESHOLD Find the best threshold (epsilon) to use for selecting
%outliers
%   [bestEpsilon bestF1] = SELECTTHRESHOLD(yval, pval) finds the best
%   threshold to use for selecting outliers based on the results from a
%   validation set (pval) and the ground truth (yval).
%

bestEpsilon = 0;
bestF1 = 0;
F1 = 0;
actual=yval;
stepsize = (max(pval) - min(pval)) / 1000;
for epsilon = min(pval):stepsize:max(pval)
    
    % ====================== YOUR CODE HERE ======================
    % Instructions: Compute the F1 score of choosing epsilon as the
    %               threshold and place the value in F1. The code at the
    %               end of the loop will compare the F1 score for this
    %               choice of epsilon and set it to be the best epsilon if
    %               it is better than the current choice of epsilon.
    %               
    % Note: You can use predictions = (pval < epsilon) to get a binary vector
    %       of 0's and 1's of the outlier predictions
    pred      = pval<epsilon;
    t_pos  = sum(((actual-pred)==0).*actual);
    t_neg  = sum(((actual-pred)==0).*(1-actual));
    f_neg = sum((actual-pred)==1);
    f_pos = sum((actual-pred)==-1);

    Precision  = t_pos/((t_pos+f_pos)+((t_pos+f_pos)==0));
    Recall  = t_pos/((t_pos+f_neg)+((t_pos+f_pos)==0));
    F1 = 2* Precision*Recall/(( Precision+Recall)+(( Precision+Recall)==0));
    % =============================================================

    if F1 > bestF1
       bestF1 = F1;
       bestEpsilon = epsilon;
    end
end

end
