function fminsearch
    % define function
    f = @(x) 2*sin(x) - x.^2/30;
    
    % define inverted function
    inv_f = @(x) -f(x);
    
    % initial guess points
    initialGuesses = [-5.5, -2.5, 0.5, 4, 7];
    
    options = optimset('Display', 'iter'); % option to display iteration information

    fprintf('Finding Minima:\n');
    for i = 1:length(initialGuesses)
        [x_min, f_min, exitflag, output] = fminsearch(f, initialGuesses(i), options);
        fprintf('Initial guess: %g\nx_min: %g\nf_min: %g\nEvaluations: %d\n', ...
                initialGuesses(i), x_min, f_min, output.funcCount);
    end

    fprintf('\nFinding Maxima:\n');
    for i = 1:length(initialGuesses)
        [x_max, f_max_inv, exitflag, output] = fminsearch(inv_f, initialGuesses(i), options);
        fprintf('Initial guess: %g\nx_min: %g\nf_min: %g\nEvaluations: %d\n', ...
                initialGuesses(i), x_max, -f_max_inv, output.funcCount);
    end
end