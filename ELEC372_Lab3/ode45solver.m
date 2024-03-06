function ode_sol = ode45solver(t_max, x0, y0, z0, sigma, rho, beta)

    time = [0 t_max];
    init_cond = [x0; 
                y0; 
                z0];

%Lorenz system of equations
lorenz_func = @(t, xyz)[sigma*((xyz(2)-xyz(1)));
                        (xyz(1)*(rho-xyz(3)))-xyz(2)
                        xyz(1)*xyz(2)-beta*xyz(3)];

%ode solver, producing x,y,z values for the system
[t, xyz] = ode45(lorenz_func, time, init_cond);

x = xyz(:, 1);
y = xyz(:, 2);
z = xyz(:, 3);

ode_sol = [t, x, y, z];
end