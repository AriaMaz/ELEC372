[A, b] = mappNETLIST('Netlist_Fig2.txt');
x = A\b;

disp('Node Voltages:');
fprintf('V1 = %f V\n', x(1));
fprintf('V2 = %f V\n', x(2));
fprintf('V3 = %f V\n', x(3));