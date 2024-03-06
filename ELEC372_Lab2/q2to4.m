%q2, using netlist from figure 1 with mappNETLIST
%%0 Hz
[A_Fig1, b_Fig1] = mappNETLIST('Netlist_Fig1.txt', 0);

disp('Question 2:');
disp('Matrix A:');
disp(A_Fig1);
disp('Vector b:');
disp(b_Fig1);

[x_fig1] = GaussElimPivot(A_Fig1, b_Fig1);
[x_fig1_PLU] = PLUSolver(A_Fig1, b_Fig1);

disp('Question 3a:');
disp('Matrix x:');
disp(x_fig1);

disp('Question 3b:');
disp('Matrix x:');
disp(x_fig1_PLU);

%%60Hz
disp('60 Hz Results:')
[A_Fig1, b_Fig1] = mappNETLIST('Netlist_Fig1.txt', 60);
[x_fig1] = GaussElimPivot(A_Fig1, b_Fig1);
[x_fig1_PLU] = PLUSolver(A_Fig1, b_Fig1);

disp('Question 2:');
disp('Matrix A:');
disp(A_Fig1);
disp('Vector b:');
disp(b_Fig1);

disp('Question 3a:');
disp('Matrix x:');
disp(x_fig1);

disp('Question 3b:');
disp('Matrix x:');
disp(x_fig1_PLU);

