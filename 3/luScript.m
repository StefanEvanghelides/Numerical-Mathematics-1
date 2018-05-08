% Create random 10x10 matrix and random solution vector
A = rand(10);
x = rand(10,1);
% calculate b
b = A*x;
c_est = luNaive(A,b);

for i = 1:16
    epsilon(i) = 10^-i;
    rel_err(i) = norm(c - c_est)/norm(c);
    cond(A_eps,2);
    cond(L_eps,2);
    cond(U_eps,2);
    cond(A_eps - L_eps*U_eps,'fro');
end