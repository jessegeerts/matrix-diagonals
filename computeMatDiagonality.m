function [r] = computeMatDiagonality(A)
%COMPUTEMATDIAGONALITY Compute how diagonal a matrix is between -1 and 1
%   The idea is to treat the matrix entries as frequencies of draws
%   from two random variables X and Y, which have values between 1 and d,
%   where d is the dimensionality of the matrix. If they're perfectly
%   correlated, all entries will be on the diagonal. If they're perfectly
%   independent all (x, y) pairs will be written to uniform random places
%   in the matrix. 
%   So we want to compute the correlation coefficient between row and
%   column entries. 

[d, d2] =size(A);

if ~isequal(d,d2)
    error('Must be square matrix')
end

ids = 1:d;  % range of values X and Y can take
ids2 = ids.^2;
vec_ones = ones(1, d);

% compute some intermediate variables 
n = vec_ones * A * vec_ones';
sumX = ids * A * vec_ones';
sumY = vec_ones * A * ids';
sumX2 = ids2 * A * vec_ones';
sumY2 = vec_ones * A * ids2';
sumXY = ids * A * ids';

% compute corrcoef according to standard formula 
num = n * sumXY - sumX * sumY;
denom = sqrt(n * sumX2 - sumX.^2) * sqrt(n * sumY2 - (sumY).^2);
r = num / denom;

end

