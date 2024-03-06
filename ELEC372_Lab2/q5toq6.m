%q5

vSourceMin=-60;
VSourceMax=60;
VSource_Sampling = vSourceMin:0.01:VSourceMax;

v3_Magnitude = [];
v3_Phase = [];
v3_Mag = [];
v3_Ph = [];

v3_Magnitude_Gauss = [];
v3_Phase_Gauss = [];
v3_Mag_Gauss = [];
v3_Ph_Gauss = [];

t_Gaussian = 0;
t_PLU = 0;


%%PLU
for i = VSource_Sampling
    tic;
    [A_Fig1, b] = mappNETLIST('Netlist_Fig1.txt', 60);
    b(length(b)) = i;
    [x_fig1_PLU] = PLUSolver(A_Fig1, b);
    v3_Magnitude=abs(x_fig1_PLU(3));
    v3_Phase = angle(x_fig1_PLU(3))*(180/pi);

    v3_Mag = [v3_Mag, v3_Magnitude];
    v3_Ph = [v3_Ph, v3_Phase];
    t_PLU = t_PLU + toc;
   
end
fprintf('%0.2f seconds\n', t_PLU);

figure;
plot(VSource_Sampling, v3_Mag);
xlabel('Source Voltage (V)');
ylabel('Magnitude of Node 3 Voltage (V)');
title('Magnitude of Voltage at Node 3 vs Source Voltage (PLU)');

figure;
plot(VSource_Sampling, v3_Ph);
xlabel('Source Voltage (V)');
ylabel('Phase of Node 3 Voltage (Deg)');
title('Phase of Voltage at Node 3 vs Source Voltage (PLU)');





%%Gaussian calculation
for i = VSource_Sampling
    tic;
    [A_Fig1_Gauss, b_Gauss] = mappNETLIST('Netlist_Fig1.txt', 60);
    b_Gauss(length(b_Gauss)) = i;
    [x_fig1_Gauss] = GaussElimPivot(A_Fig1_Gauss,b_Gauss);
    v3_Magnitude_Gauss=abs(x_fig1_Gauss(3));
    v3_Phase_Gauss = angle(x_fig1_Gauss(3))*(180/pi);
    v3_Mag_Gauss = [v3_Mag_Gauss, v3_Magnitude_Gauss];
    v3_Ph_Gauss = [v3_Ph_Gauss, v3_Phase_Gauss];

    t_Gaussian = t_Gaussian + toc;
end
fprintf('%0.2f seconds\n', t_Gaussian);
figure;
plot(VSource_Sampling, v3_Mag_Gauss);
xlabel('Source Voltage (V)');
ylabel('Magnitude of Node 3 Voltage (V)');
title('Magnitude of Voltage at Node 3 vs Source Voltage (Gaussian)');

figure;
plot(VSource_Sampling, v3_Ph_Gauss);
xlabel('Source Voltage (V)');
ylabel('Phase of Node 3 Voltage (Deg)');
title('Phase of Voltage at Node 3 vs Source Voltage (Gaussian)');