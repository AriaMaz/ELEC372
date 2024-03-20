function newtonraphsonmethod
    % define derivative function
    df = @(x) 2*cos(x) - x/15;
    
    % define second derivative function
    ddf = @(x) -2*sin(x) - 1/15;

    % initial guess points
    initialGuesses = [-5.5, -2.5, 0.5, 4, 7];
    
    % output table
    fprintf('Initial Guess |  x_opt  | fprime(x_opt) |  N\n');
    
    for i = 1:length(initialGuesses)
        [x_opt, df_opt, N] = newtonRaphson(df, ddf, initialGuesses(i));
        fprintf('   %6.2f     | %7.4f |%10.4f     |%3d\n', ...
                initialGuesses(i), x_opt, df_opt, N);
    end
end

function [x_opt, df_opt, N] = newtonRaphson(df, ddf, x0)
    tol = 1e-5; % tolerance for convergence
    maxIterations = 1000;
    N = 0; % function evaluation counter
    
    x = x0; % start
    for i = 1:maxIterations
        fx = df(x);
        dfx = ddf(x);
        dx = -fx/dfx;
        x = x + dx; % update x
        N = N + 1; % updating function evaluation counter
        
        % check for convergence
        if abs(dx) < tol * abs(x)
            break;
        end
    end
    
    x_opt = x; % best approximation of root
    df_opt = df(x_opt); % function value at the root
end