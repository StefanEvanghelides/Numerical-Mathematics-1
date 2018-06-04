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
