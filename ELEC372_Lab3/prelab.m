%prelab with ode45plotter function
close all;

%Given parameters
t_max = 100;
x0 = 1;
y0 = 0.5;
z0 = 0.3;
sigma = 10;
rho = 28;
beta = 8/3;

%separate ode45 function
prelab_sol = ode45solver(t_max, x0, y0, z0, sigma, rho, beta);

%output extraction
t = prelab_sol(:, 1);
x = prelab_sol(:, 2);
y = prelab_sol(:, 3);
z = prelab_sol(:, 4);

%Question 1, all plots
figure;
plot(t, x, 'g');
hold on;
plot(t,y, 'r');
plot(t, z, 'm');
hold off;
title('Lorenz system of equations time plots');
xlabel('time(s)');
ylabel('Function Output');
legend('x(t)', 'y(t)', 'z(t)');
grid on;

%Question 1 x(t) plot
figure;
plot(t, x, 'r');
title('x(t)');
xlabel('time(s)');
ylabel('x(t)');
grid on;
    
%Question 1, y(t) plot
figure;
plot(t, y, 'r');
title('y(t)');
xlabel('time(s)');
ylabel('y(t)');
grid on;
    
%Question 1, z(t) plot
figure;
plot(t, z, 'm');
title('z(t)');
xlabel('time(s)');
ylabel('z(t)');
grid on;

%Question 2, strange attractors y-x, z-x
figure;
plot(x, y);
title('Strange Attractor of y(t) vs x(t)');
xlabel('x(t)');
ylabel('y(t)');
grid on;

figure;
plot(x, z);
title('Strange Attractor of z(t) vs x(t)');
xlabel('x(t)');
ylabel('z(t)');
grid on;

%Question 3, 3D trajectory
figure;
plot3(x, y, z);
title('Three dimensional trajectory of [x(t), y(t), z(t)]');
xlabel('x(t)');
ylabel('y(t)');
zlabel('z(t)');
grid on;