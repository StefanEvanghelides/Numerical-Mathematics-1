% Create random 10x10 matrix and random solution vector
A = rand(10);
x = rand(10,1);
% calculate b
b = A*x;
c_est = luNaive(A,b);