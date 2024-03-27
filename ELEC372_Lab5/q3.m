function iterations_vs_stepsize
    % Define a range of step sizes
    step_sizes = linspace(0.001, 0.1, 50);
    iterations = zeros(size(step_sizes));
    
    % Starting point
    starting_point = [0, 1];
    
    % Loop over the step sizes
    for i = 1:length(step_sizes)
        % Get the number of iterations for current step size
        iterations(i) = perform_gradient_descent(starting_point(1), starting_point(2), step_sizes(i));
    end
    
    % Plotting
    figure;
    plot(step_sizes, iterations, '-o');
    xlabel('Step Size h');
    ylabel('Number of Iterations');
    title('Iterations vs Step Size for Gradient Descent');
    grid on;
end

function num_iterations = perform_gradient_descent(x_start, y_start, step_size)
    % Tolerance and maximum iterations setup
    tol = 1e-4;
    max_iter = 1000;
    
    x = x_start;
    y = y_start;
    for iter = 1:max_iter
        % Compute gradients
        grad_x = -2*x^2*y*exp(-x^2 - y^2) + y*exp(-x^2 - y^2);
        grad_y = -2*x*y^2*exp(-x^2 - y^2) + x*exp(-x^2 - y^2);
        
        % Update coordinates
        x_new = x - step_size * grad_x;
        y_new = y - step_size * grad_y;
        
        % Check for convergence
        if abs(x_new - x)/abs(x) < tol && abs(y_new - y)/abs(y) < tol
            break;
        end
        
        x = x_new;
        y = y_new;
    end
    
    % Return the number of iterations it took to converge
    num_iterations = iter;
end