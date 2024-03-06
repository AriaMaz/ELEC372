function euler_sol = eulersolver(t_max, delta_t, x0, y0, z0, sigma, rho, beta)

time = 0:delta_t:t_max;

xj = zeros(size(time));
yj = zeros(size(time));
zj = zeros(size(time));

x = x0;
y = y0;
z = z0;

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

euler_sol = [time', xj', yj', zj'];

end

