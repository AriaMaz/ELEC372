% Define the range for x and y
x = linspace(-4, 4, 150);
y = linspace(-4, 4, 150);

% Create a meshgrid for x and y
[X, Y] = meshgrid(x, y);

% Define the function f(x, y) 
F = X .* Y .* exp(- (X.^2 + Y.^2));

% Create the 3D plot
figure;
surf(X, Y, F) 

% Enhancements for visualizationq1
title('3D plot of f(x, y) = xyexp(-[x^2 + y^2])')
xlabel('X axis')
ylabel('Y axis')
zlabel('f(x, y)')

% Rotate the view to get a better angle
view(-45, 45)
