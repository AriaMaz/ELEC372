% function
f = @(x) 2*sin(x) - x.^2/30;

% first derivative
df = @(x) 2*cos(x) - x/15;

% Plot function over range
x = linspace(-6, 9, 1000);
plot(x, f(x))
hold on

% Use initial guess based on plot and fzero to find zeros of first derivative 
initialGuesses = [-5, 0, 2, 5, 8];
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