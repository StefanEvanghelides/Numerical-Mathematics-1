% Definitions for Poisson method
N = 10;
tol = 10^-12;
maxIt = 10^3;

% Defining A and b in Ax = b
A = gallery('poisson', N);
b = ones(N^2,1)/(N^2);

x0 = zeros(N^2, 1);
experiments = iterCompare(A,b,x0,tol,maxIt);

% Plotting the surface of x
figure('Name','Solution to Poisson','NumberTitle','off');
x = experiments(2).x;
x_reshape = reshape(x,N,N);
surf(x_reshape, 'DisplayName', 'Solution');
colormap(gray(50));
title('Solution to Poisson');
zlabel('Value');
legend('Location', 'best');

% REMAKR ON SPARSITY
Q = gallery('poisson', 100);
whos Q
fullQ = full(Q);
whos fullQ