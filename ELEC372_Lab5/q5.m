function gradient_descent_minimization
    % Set the starting point
    x0 = -0.5;
    y0 = -1;
    
    % Set the step sizes
    alpha = 0.01; % Step size for gradient descent
    delta = 0.001; % Step size for central difference formula

    % Set convergence tolerance and maximum number of iterations
    tolerance = 1e-6;

    % Initialize variables
    x = x0;
    y = y0;
    iteration = 0;

    % Gradient descent loop
    while true
        iteration = iteration + 1;
        
        % Numerically approximate gradient using central difference
        grad_x = (f(x + delta, y) - f(x - delta, y)) / (2 * delta);
        grad_y = (f(x, y + delta) - f(x, y - delta)) / (2 * delta);
        
        % Update x and y using the gradient descent step
        x_new = x - alpha * grad_x;
        y_new = y - alpha * grad_y;

        % Check for convergence
        if (norm([x_new - x, y_new - y]) < tolerance)
            fprintf('Converged to minimum at (%.6f, %.6f) with function value %.6f\n', ...
                    x_new, y_new, f(x_new, y_new));
            break;
        end
        
        % Update x and y for the next iteration
        x = x_new;
        y = y_new;
        
        % Display current estimate
        fprintf('Iteration %d: x = %.6f, y = %.6f, f(x, y) = %.6f\n', ...
                iteration, x, y, f(x, y));
    end
end

% Function definition
function value = f(x, y)
    value = (x^5 - y^3 - 2*x^2*y^2) * exp(-(x^2 + y^2));
end