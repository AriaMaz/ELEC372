close all;
t_max = 100;
delta_t = 0.001;
x0 = 1;
y0 = 0.5;
z0 = 0.3;
sigma = 10;
rho = 28;
beta = 8/3;


time_steps = 0:delta_t:t_max;


%ode solver, producing x,y,z values for the system

x = x0;
y = y0;
z = z0;

%Lorenz system of equations

lorenz_func = @(x, y, z)[y;
                        z;
                        -z-x-1e-9*(exp(y/0.026)-1)];



num_steps = length(time_steps);
    x_plot = zeros(num_steps, 1);
    y_plot = zeros(num_steps, 1);
    z_plot = zeros(num_steps, 1);


%RK4_sol = zeros(num_steps, 3);
%RK4_sol(1, :) =[x, y , z];

for i = 1:num_steps
    t = i + delta_t;

    %step 1
    k1 = lorenz_func(x, y, z);

    %step 2
    k2 = lorenz_func(x+k1(1)*delta_t*0.5, y+k1(2)*delta_t*0.5, z+k1(3)*delta_t*0.5);

    %step 3
    k3 = lorenz_func(x+k2(1)*delta_t*0.5, y+k2(2)*delta_t*0.5, 3+k1(3)*delta_t*0.5);

    %step 4
    k4 = lorenz_func(x+k3(1)*delta_t, y+k3(2)*delta_t, 3+k3(3)*delta_t);

    x = x + (delta_t/6) * (k1(1) + 2*k2(1) + 2*k3(1) + k4(1));
    y = y + (delta_t/6) * (k1(2) + 2*k2(2) + 2*k3(2) + k4(2));
    z = z + (delta_t/6) * (k1(3) + 2*k2(3) + 2*k3(3) + k4(3));
    
    x_plot(i, 1) = x;
    y_plot(i, 1) = y;
    z_plot(i, 1) = z;
end

figure;
plot(x_plot, y_plot);
title('Strange Attractor of y(t) vs x(t)');
xlabel('x(t)');
ylabel('y(t)');
grid on;

