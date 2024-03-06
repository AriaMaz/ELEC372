%%Write a MATLAB script to call the mappNETLIST function and solve for the output voltage 
% over a frequency range from 0 Hz to 1 MHz with a 100 Hz step size. The script should 
% produce a plot of the magnitude voltage transfer function H (in dB) as a function of the frequency f.


f_min = 0;
f_max = 1*10^9;
f_Sample= f_min:100:f_max;
NETLIST=zeros(height(b),1);
for i = f_Sample
    [A, b] = mappNETLIST('figure_2.txt', i);
    x = PLUSolver(A,b);
    Vo(i)=x(4,1);
end
plot(Vo);
x