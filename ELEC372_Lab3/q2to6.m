%q2 to q6 with euler plotter function
close all;

t_max = 100;
delta_t = 0.001;
x0 = 1;
y0 = 0.5;
z0 = 0.3;
sigma = 10;
rho = 28;
beta = 8/3;

eulerPlot_sol = eulersolver(t_max, delta_t, x0, y0, z0, sigma, rho, beta);

time = eulerPlot_sol(:, 1);
xj = eulerPlot_sol(:, 2);
yj = eulerPlot_sol(:, 3);
zj = eulerPlot_sol(:, 4);


%plots

figure;
plot(time, xj, 'r');
title('Lorenz system of equations solution for xj(t) using Eulers method.');
xlabel('time(s)');
ylabel('xj(t)');
grid on;

figure;
plot(time, yj, 'r');
title('Lorenz system of equations solution for yj(t) using Eulers method.');
xlabel('time(s)');
ylabel('yj(t)');
grid on;

figure;
plot(time, zj, 'r');
title('Lorenz system of equations solution for zj(t) using Eulers method.');
xlabel('time(s)');
ylabel('zj(t)');
grid on;


%Question 5 strange attractors y-x, z-x
figure;
plot(xj, yj);
title('Strange Attractor of yj(t) vs xj(t) - Eulers Method');
xlabel('xj(t)');
ylabel('yj(t)');
grid on;

figure;
plot(xj, zj);
title('Strange Attractor of zj(t) vs xj(t) - Eulers Method');
xlabel('xj(t)');
ylabel('zj(t)');
grid on;

%question 6
figure;
plot3(xj, yj, zj);
hold on;
%x0, y0, z0 initial point
plot3(x0, y0, z0, 'ro', 'MarkerSize', 3);
%final point
plot3(xj(length(xj)), xj(length(xj)), xj(length(xj)), 'ko', 'MarkerSize', 3);
hold off;
title('Three dimensional trajectory of [xj(t), yj(t), zj(t)]');
xlabel('xj(t)');
ylabel('yj(t)');
zlabel('zj(t)');
grid on;

%start to end point distance
dist = sqrt(((xj(length(xj))-x0)^2) + ((yj(length(yj))-y0)^2) + ((zj(length(zj))-z0)^2));
fprintf("The distance between the starting and end point is: %0.4f units\n", dist);
