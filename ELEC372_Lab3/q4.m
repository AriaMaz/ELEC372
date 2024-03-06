close all;

%init conditions
delta_t = 0.001;
time = 0:delta_t:100;
sigma = 10;
rho = 28;
beta = 8/3;

xj = zeros(size(time));
yj = zeros(size(time));
zj = zeros(size(time));

x = 1;
y = 0.5;
z = 0.3;

%Eulers method
for i = 1:length(time)
    xj(i) = x;
    yj(i) = y;
    zj(i) = z;

    xj_plus1 = (sigma*delta_t*(y-x)) + x;
    yj_plus1 = (delta_t * (x * (rho - z) - y)) + y;
    zj_plus1 = (delta_t*x*y) - (beta*delta_t*z) + z;

    x = xj_plus1;
    y = yj_plus1;
    z = zj_plus1;
end


%ode 45 method
init_cond = [1; 
            0.5; 
            0.3];

lorenz_func = @(t, xyz)[sigma*((xyz(2)-xyz(1)));
                        (xyz(1)*(rho-xyz(3)))-xyz(2)
                        xyz(1)*xyz(2)-beta*xyz(3)];

[t, xyz] = ode45(lorenz_func, time, init_cond);

x_ode45 = xyz(:, 1);
y_ode45 = xyz(:, 2);
z_ode45 = xyz(:, 3);



%plot x, y, z comparison plots
figure;
plot(t, xj, 'b');
hold on;
plot(time, x_ode45, 'r');
title('Lorenz system of equations solution for x(t) - Euler vs. ode45');
xlabel('time(s)');
ylabel('x(t)');
legend('Eulers Method', 'ode45 Function');
grid on;

figure;
plot(t, yj, 'b');
hold on;
plot(time, y_ode45, 'r');
title('Lorenz system of equations solution for y(t) - Euler vs. ode45');
xlabel('time(s)');
ylabel('y(t)');
legend('Eulers Method', 'ode45 Function');
grid on;

figure;
plot(t, zj, 'b');
hold on;
plot(time, z_ode45, 'r');
title('Lorenz system of equations solution for z(t) - Euler vs. ode45');
xlabel('time(s)');
ylabel('z(t)');
legend('Eulers Method', 'ode45 Function');
grid on;

