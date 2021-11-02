function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

% Store results in struct, for fun.
CV_results = struct();

params = [0.01, 0.03, 0.10, 0.30, 1.00, 3.00, 10.0, 30.0];
sz = size(params,2);

C_best = 1;
sigma_best = 1;
error_min = 1;

fprintf("Start CV parameter search on C, sigma; %d points\n", sz);
for i = 1:sz
	  for j = 1:sz
      	C = params(i);
        sigma = params(j);
        
        fprintf("\nTraining on C = %0.2f, sigma = %0.2f\n", C, sigma);

        % Train SVM model on current params.
        model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
        predictions = svmPredict(model, Xval);
        error = mean(double(predictions ~= yval));
        
        CV_results.C = C;
        CV_results.sigma = sigma;
        CV_results.error = error;
        
        % If error is smaller than previous, set new best params.
        if ( error <= error_min )
          C_best = C;
          sigma_best = sigma;
          error_min = error;
          
        endif
        
        fprintf("Error = %0.8f\n", error);
	  endfor
endfor

CV_results

fprintf("Best params (C, sigma) = (%0.2f, %0.2f)", C_best, sigma_best);

% Return best params.
C = C_best;
sigma = sigma_best;

% =========================================================================

end
