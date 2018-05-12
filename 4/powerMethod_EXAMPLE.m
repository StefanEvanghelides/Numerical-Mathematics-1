% INPUT
% A             matrix
% x0            initial guess
% tol           desired tolerance
% maxIt         maximum number of iterations
% OUTPUT
% lambda        eigenvalue of A largest in magnitude
% x             corresponding eigenvector
% flag          if 0 then tolerance is attained
% lambdaHist    approximate eigenvalue per iteration
% convHist      error estimate per iteration
function [lambda, x, flag, lambdaHist, convHist] =...
        powerMethod(A, x0, tol, maxIt)
