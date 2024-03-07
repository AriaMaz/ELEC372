function RK4_sol = RK4Solver(t_max, delta_t, x0, y0, z0, sigma, rho, beta)

time_steps = 0:delta_t:t_max;
%Lorenz system of equations

lorenz_func = @(t, x, y, z)[ t;
                            sigma*(y-x);
                            x*(rho-z)-y
                            x*y - beta*z];

%ode solver, producing x,y,z values for the system

x = x0;
y = y0;
z = z0;


RK4_sol = zeros(length(time_steps), 4);
RK4_sol(1, :) =[0, x, y , z];

for i = 1:length(time_steps)
    t = i+delta_t;

    %step 1
    k1 = lorenz_func(t, x, y, z);
 
    %step 2
    k2 = lorenz_func(t+(0.5*delta_t), x+k1(2)*delta_t*0.5, y+k1(3)*delta_t*0.5, z+k1(4)*delta_t*0.5);

    %step 3
    k3 = lorenz_func(t+(0.5*delta_t), x+k2(2)*delta_t*0.5, y+k2(3)*delta_t*0.5, z+k1(4)*delta_t*0.5);

    %step 4
    k4 = lorenz_func(t+delta_t, x+k3(2)*delta_t, y+k3(3)*delta_t, z+k3(4)*delta_t);

    x = x + (delta_t/6) * (k1(2) + 2*k2(2) + 2*k3(2) + k4(2));
    y = y + (delta_t/6) * (k1(3) + 2*k2(3) + 2*k3(3) + k4(3));
    z = z + (delta_t/6) * (k1(4) + 2*k2(4) + 2*k3(4) + k4(4));
    
    RK4_sol(i+1, :) = [(i * delta_t), x, y, z];
end
end
