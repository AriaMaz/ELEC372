close all;

%%input parameters
t_max = 100;
delta_t = 0.001;
x0 = 1;
y0 = 0.5;
z0 = 0.3;
sigma = 10;
rho = 28;
beta = 8/3;

%dx_dt = sigma*(y0-x0);
%dy_dt = ((x0)*(rho-z0)) - y0;
%dz_dt = x0*y0-beta*z0;


%functions
ode45_sol = ode45solver(t_max, x0, y0, z0, sigma, rho, beta);
RK4_sol = RK4Solver(t_max, delta_t, x0, y0, z0, sigma, rho, beta);

%output value extraction
time = ode45_sol(:, 1);
x_ode45 = ode45_sol(:, 2);
y_ode45 = ode45_sol(:, 3);
z_ode45 = ode45_sol(:, 4);

x_RK4 = RK4_sol(:, 2);
y_RK4 = RK4_sol(:, 3);
z_RK4 = RK4_sol(:, 4);


%start to end point distance - ode45
dist_ode45 = sqrt((x_ode45(length(x_ode45))-x0^2) + (y_ode45(length(y_ode45))-y0^2) + (z_ode45(length(z_ode45))-z0^2));
fprintf("The ode45 distance between the starting and end point is: %0.4f units\n", dist_ode45);
%start to end point distance - RK4
dist_RK4 = sqrt((x_RK4(length(x_RK4))-x0^2) + (y_RK4(length(y_RK4))-y0^2) + (z_RK4(length(z_RK4))-z0^2));
fprintf("The ode45 distance between the starting and end point is: %0.4f units\n", dist_RK4);
% percentage difference between RK4 and ode45
sensitivity = (1-(dist_RK4/dist_ode45))*100;
fprintf("There is a %0.2f%% difference between the start to end point distances in RK4 method vs ode45 method.\n", sensitivity);


%plotting
figure;
plot3(x_ode45, y_ode45, z_ode45);
hold on;
plot3(x_RK4, y_RK4, z_RK4, 'r');
%final point
hold off;
title('Three dimensional trajectory plot comparsion between ode45 & RK4 method');
xlabel('x(t)');
ylabel('y(t)');
zlabel('z(t)');
legend('ode45', 'RK4');
grid on;