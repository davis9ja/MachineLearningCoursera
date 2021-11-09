function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%

% In Python, you could very simply use a numpy function like argwhere to get
% the indices of a list that satisfy a boolean condition. Not sure how to do
% this in Octave without writing a function to do it for you. Octave is an
% educational language, so I'm not going to worry about it.

counts = zeros(K, 1)

for i = 1:m
  for j = 1:K
    if ( idx(i) == j )
      centroids(j,:) += X(i,:)
      counts(j,1) += 1
    endif
  endfor
endfor

for i = 1:K
  centroids(i,:) /= counts(i,1)
endfor




% =============================================================


end

