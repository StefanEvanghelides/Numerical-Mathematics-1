

% Set all variables to prevent side effects 
N = 10;
tol = 10^-12;
maxIt = 10^3;

A = gallery('poisson', N);
b = ones(N^2,1)/(N^2);
x0 = zeros(N^2, 1);
r0 = b - A*x0;

% Calculate the Jacobi iteration matrix
alpha_opt = 1/4;
P_jacobi = spdiags(diag(A), 0, size(A, 1), size(A, 2));
B = eye(N^2) - alpha_opt * (P_jacobi \ A); 


spectralR = abs(eigs(B,1));
k_min = 1;

while spectralR > tol && k_min < maxIt
    % Loop until we have reached tolerance
    spectralR = spectralR*spectralR;
    k_min = k_min + 1;
end