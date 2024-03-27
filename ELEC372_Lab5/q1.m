function newtons_method_optimization()
    % Initial starting points
    starting_points = [-0.9, 0.9; 0.9, -0.9; -0.9, -0.9; 0.9, 0.9];
    
    % Iterate over each starting point
    for i = 1:size(starting_points, 1)
        fprintf('Starting point: (%.2f, %.2f)\n', starting_points(i, 1), starting_points(i, 2));
        [opt_x, opt_y, f_val] = newtons_method(starting_points(i, :));
        fprintf('Optimum found at: (%.4f, %.4f) with f(x, y) = %.4f\n\n', opt_x, opt_y, f_val);
    end
end

function [opt_x, opt_y, f_val] = newtons_method(start_point)
    % Tolerance for the relative change
    tolerance = 1e-6;
    
    % Current point
    x = start_point(1);
    y = start_point(2);
    
    % Iteration counter to prevent infinite loops
    iter = 0;
    maxIter = 1000;
    
    while iter < maxIter
        iter = iter + 1;
        
        % Gradient vector
        grad = [y*exp(-x^2 - y^2)*(1 - 2*x^2);
                x*exp(-x^2 - y^2)*(1 - 2*y^2)];
            
        % Hessian matrix
        H = [4*x^3*y*exp(-x^2 - y^2) - 6*x*y*exp(-x^2 - y^2), 4*x^2*y^2*exp(-x^2 - y^2) - 2*x^2*exp(-x^2 - y^2) - 2*y^2*exp(-x^2 - y^2) + exp(-x^2 - y^2);
             4*x^2*y^2*exp(-x^2 - y^2) - 2*x^2*exp(-x^2 - y^2) - 2*y^2*exp(-x^2 - y^2) + exp(-x^2 - y^2), 4*x*y^3*exp(-x^2 - y^2) - 6*x*y*exp(-x^2 - y^2)];
         
        % Newton's method update step
        delta = -H\grad;
        x_new = x + delta(1);
        y_new = y + delta(2);
        
        % Check for convergence
        if norm([x_new - x; y_new - y]) / norm([x; y]) < tolerance
            break;
        end
        
        % Update current point
        x = x_new;
        y = y_new;
        
        % Display current estimate and function value
        f_val = x*y*exp(-x^2 - y^2);
        fprintf('Iteration %d: x = %.4f, y = %.4f, f(x, y) = %.4f\n', iter, x, y, f_val);
    end
    
    % Return the optimum point and function value
    opt_x = x;
    opt_y = y;
    f_val = x*y*exp(-x^2 - y^2);
end