function goldensectionsearch
    % define function
    f = @(x) 2*sin(x) - x.^2/30;

    % initial bracketing intervals
    intervals = [-6 -3; -3 0; 0 3; 3 6; 6 9];
    
    % output table
    fprintf('Interval | x_opt | f(x_opt) | N\n');

    for i = 1:size(intervals, 1)
        [x_opt, f_opt, N] = goldenSection(f, intervals(i, :));
        fprintf('[%2d, %2d] |%7.4f|%9.4f |%3d\n', ...
                intervals(i, 1), intervals(i, 2), x_opt, f_opt, N);
    end
end

function [x_opt, f_opt, N] = goldenSection(f, interval)
    phi = (1 + sqrt(5)) / 2;
    a = interval(1);
    b = interval(2);
    c = b - (b - a) / phi;
    d = a + (b - a) / phi;
    tol = 1e-5; % tolerance for convergence
    N = 0; % function evaluation counter
    
    while abs(c - d) > tol
        if f(c) < f(d)
            b = d;
        else
            a = c;
        end
        
        % update points
        c = b - (b - a) / phi;
        d = a + (b - a) / phi;
        N = N + 2; % two function evaluations per iteration
    end
    
    % choose best approximation
    x_opt = (b + a) / 2;
    f_opt = f(x_opt);
end