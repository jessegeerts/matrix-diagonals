% MATLAB script

% first make an off-diagonal matrix for testing 
matSize = 10;
offset = 2;
A = diag(ones(1,matSize-offset), offset);

[slope, intercept] = computeRegressionParameters(A);

x = 1:matSize;
y = slope*x + intercept;

x_adjusted = y;
y_adjusted = x;

imagesc(A);
colorbar; 

hold on;

plot(x_adjusted, y_adjusted, 'r', 'LineWidth', 2); 

