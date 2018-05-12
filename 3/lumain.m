% This script is used to test the naive LU factorization

% Predefine A, x, b
A = [1, 2, 3;
     4, 5, 6;
     7, 8, 8];
 
x = [1; 2; 3];

b = A * x;

% Knowing A and b, we will try to find x by decomposing A into LU factors
[L, U] = luNaive(A);

% Displaying results
L
U
L * U
A
x1 = (L * U) \ b