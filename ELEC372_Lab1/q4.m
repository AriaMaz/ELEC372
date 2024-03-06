[A, b] = mappNETLIST('Netlist_Example.txt');
node_voltages = A\b;

disp('Node Voltages:');
for i = 1:length(node_voltages)
    fprintf('V%d = %f V\n', i, node_voltages(i));
end