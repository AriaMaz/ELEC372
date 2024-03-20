% Define the function
f = @(x) 2*sin(x) - x.^2/30;

% Define the first derivative of the function
df = @(x) 2*cos(x) - x/15;

% Plot the function over the given range
x = linspace(-6, 9, 1000);
plot(x, f(x))
hold on

% Use fzero to find zeros of the first derivative within the given range
% We provide initial guesses based on the plotted function
initialGuesses = [-5, 0, 5, 8];
zerosDf = zeros(1, length(initialGuesses));

for i = 1:length(initialGuesses)
    zerosDf(i) = fzero(df, initialGuesses(i));
    % Mark critical points on the graph
    plot(zerosDf(i), f(zerosDf(i)), 'ro');
end

hold off
title('Function f(x) and its Critical Points')
xlabel('x')
ylabel('f(x)')
legend('f(x)', 'Critical Points', 'Location', 'best')

% Output the critical points
disp('Critical points at x = ');
disp(zerosDf);