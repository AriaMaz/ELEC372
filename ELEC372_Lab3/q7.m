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


%start to end point distance for q6
dist = sqrt(((xj(length(xj))-x0)^2) + ((yj(length(yj))-y0)^2) + ((zj(length(zj))-z0)^2));
fprintf("The distance between the starting and end point for q6 is: %0.4f units\n", dist);


%%q7 comparison

x0_q7 = 1;
y0_q7 = 0.5;
z0_q7 = 0.31;

%%values are halved
sigma_q7 = 5;
rho_q7 = 14;
beta_q7 = 8/6;

eulerPlot_sol = eulersolver(t_max, delta_t, x0_q7, y0_q7, z0_q7, sigma_q7, rho_q7, beta_q7);

xj_q7 = eulerPlot_sol(:, 2);
yj_q7 = eulerPlot_sol(:, 3);
zj_q7 = eulerPlot_sol(:, 4);

dist_q7 = sqrt(((xj_q7(length(xj_q7))-x0_q7)^2) + ((yj_q7(length(yj_q7))-y0_q7)^2) + ((zj_q7(length(zj_q7))-z0_q7)^2));
fprintf("The distance between the starting and end point for q7 is: %0.4f units\n", dist_q7); 

sensitivity = (dist_q7/dist)*100;
fprintf("There is a %0.2f%% difference between the values in q7 and q6.\n", sensitivity);
