function bisectionsearch
    % define derivative of function
    df = @(x) 2*cos(x) - x/15;

    % initial bracketing intervals
    intervals = [-6 -3; -3 0; 0 3; 3 6; 6 9];
    
    % output table
    fprintf('Interval | x_opt | f(x_opt) | N\n');
    
    for i = 1:size(intervals, 1)
        [x_opt, df_opt, N] = bisection(df, intervals(i, :));
        fprintf('[%2d, %2d] |%7.4f|%10.4f|%3d\n', ...
                intervals(i, 1), intervals(i, 2), x_opt, df_opt, N);
    end
end

function [x_opt, df_opt, N] = bisection(df, interval)
    a = interval(1);
    b = interval(2);
    tol = 1e-5; % tolerance for convergence
    N = 0; % function evaluation counter
    
    fa = df(a);
    fb = df(b);
    if fa * fb > 0
        error('f(a) and f(b) must have different signs');
    end
    
    while (b - a) / 2 > tol
        c = (a + b) / 2;
        fc = df(c);
        N = N + 1; % update function evaluation count
        
        if fc == 0
            break; % c is a root
        elseif fa * fc < 0
            b = c; % root is in the left subinterval
            fb = fc;
        else
            a = c; % root is in the right subinterval
            fa = fc;
        end
    end
    
    x_opt = (a + b) / 2; % best approximation of root
    df_opt = df(x_opt); % function value at the root
end