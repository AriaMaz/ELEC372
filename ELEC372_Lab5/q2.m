function gradient_descent
    % Starting points
    starting_points = [0, 1; 0, -1];
    
    % Step size for descent
    h = 0.01; % Adjust step size if necessary for better convergence
    
    for i = 1:size(starting_points, 1)
        fprintf('Starting descent from (%.2f, %.2f)\n', starting_points(i, 1), starting_points(i, 2));
        
        % Perform gradient descent from the starting point
        [x_min, y_min, f_min] = perform_gradient_descent(starting_points(i, 1), starting_points(i, 2), h);
        
        % Display the found minimum point and the function value at that point
        fprintf('Found minimum at (%.4f, %.4f) with function value f(x, y) = %.4f\n\n', x_min, y_min, f_min);
    end
end

function [x_min, y_min, f_min] = perform_gradient_descent(x_start, y_start, step_size)
    % Tolerance for the relative change
    tol = 1e-4;
    max_iter = 1000; % Maximum number of iterations
    
    x = x_start;
    y = y_start;
    for iter = 1:max_iter
        % Compute the gradient of the function at the current point
        grad_x = -2*x^2*y*exp(-x^2 - y^2) + y*exp(-x^2 - y^2);
        grad_y = -2*x*y^2*exp(-x^2 - y^2) + x*exp(-x^2 - y^2);
        
        % Update the x and y values based on the gradient
        x_new = x - step_size * grad_x;
        y_new = y - step_size * grad_y;
        
        % Check for convergence
        if abs(x_new - x)/abs(x) < tol && abs(y_new - y)/abs(y) < tol
            break;
        end
        
        x = x_new;
        y = y_new;
    end
    
    % Return the found minimum and the function value at that point
    x_min = x;
    y_min = y;
    f_min = x_min * y_min * exp(-(x_min^2 + y_min^2));
end