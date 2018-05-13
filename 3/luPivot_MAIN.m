% This script is used to solve the experiment WITH pivoting

A = [1 1+0.5*10^(-15) 3;
     2 2 20;
     3 6 4];

b = [1 2 3]';

[c, L, U, P] = luPivot(A, b);
c
L
U
A = inv(P)*L*U
