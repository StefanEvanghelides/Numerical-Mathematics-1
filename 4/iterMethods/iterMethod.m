% Attempts to solve A * x = b, with initial guess x0 using 
% an iterative method of the form
%           x^{k+1} = x^{k} + alpha_k P \ r^{k}, r^{k} = b - A x^{k}
% where alpha_k = alpha0 if dynamic = 0
% INPUT
% A         n x n matrix
% b         n x 1 right-hand side
% x0        initial guess
% tol       desired tolerance
% maxIt     maximum number of iterations
% P         preconditioner of A (optional)
% dynamic   0: static, 1: minimise A-norm of error, 2: minimise
%           2-norm of residual
% alpha0    if dynamic = 0, this value is used for alpha_k
% OUTPUT
% x         approximate solution to A * x = b
% flag      if 0 then tolerance is attained
% convHist  relative residual per iteration
function [x, flag, convHist] = iterMethod(A, b, x0, tol, maxIt,...
    P, dynamic, alpha0)