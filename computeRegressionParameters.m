function [slope, intercept] = computeRegressionParameters(A)
%COMPUTEREGRESSIONPARAMETERS Compute the slope and intercept of a linear regression.
%   The matrix entries are treated as frequencies of draws
%   from two random variables X and Y. This function computes the 
%   slope and intercept of the linear regression line.

[d, d2] = size(A);

if ~isequal(d,d2)
    error('Must be square matrix')
end

v = 1:d;  % range of values X and Y can take
vec_ones = ones(1, d);

% compute some intermediate variables 
n = vec_ones * A * vec_ones';
sumX = v * A * vec_ones';
sumY = vec_ones * A * v';
sumXY = v * A * v';
sumX2 = (v.^2) * A * vec_ones';

% compute slope and intercept according to normal equations
slope = (n * sumXY - sumX * sumY) / (n * sumX2 - sumX^2);
intercept = (sumY - slope * sumX) / n;

end
