% Solves the 1D Poisson problem
%       -laplace u = f on (0,1)
% with Dirichlet bdy conditions given by g
% INPUT
% f         right-hand side function
% g         Dirichlet boundary condition function
% N         number of unknowns (h = 1 / (N + 1))
% precon    'none', 'jacobi' or 'gs'
% tol       tolerance for iterative solver
% OUTPUT
% sol       (N+2) x 1 solution array
% nodes     (N+2) x 1 array with location of spatial nodes
function [sol, nodes] = poissonSolveFD(f, g, N, precon, tol)
    nodes = zeros(N+2, 1);
    b = zeros(N,1);
    
    h = 1/(N+1);
    A = makeLaplace(N);
    
    nodes(1) = 0;
    nodes(N+2) = 1;
    for i = 1:N
        nodes(i+1) = i*h;
        b(i) = h^2 * f(nodes(i+1));
    end
    
    dynamic = 2;
    maxIt = 1000;
    x0 = zeros(N,1);
    
    alpha = 0.5;
    
    lambda_max = eigs(A,1);
    lambda_min = eigs(A,1,'SM');
    alpha_opt = 2 / (lambda_max + lambda_min);
    
   
    switch precon
        case 'jacobi'
            P = spdiags(diag(A), 0, size(A, 1), size(A, 2));
        case 'gs'
            P = tril(A, 0);
        otherwise % for 'none'
            P = [];
    end
    
    [u, ~, ~] = iterMethod(A,b,x0,tol,maxIt,P,dynamic,alpha);
     
    sol = [g(1); u; g(2)];
end
