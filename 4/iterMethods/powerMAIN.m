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
surf(reshape(x,N,N), colormap(gray(50)));