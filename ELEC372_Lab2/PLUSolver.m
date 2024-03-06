function [x] = PLUSolver(A, b)
    [L, U, P] = PLU(A);
    y = inv(L)*(P*b);
    x = inv(U)*y;

end