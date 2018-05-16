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
function [lambda,x,flag,lambdaHist,convHist] = powerMethod(A,x0,tol,maxIt)
    flag = 1;   
    x0 = x0/norm(x0);
    product = A*x0;
    lambdaHist(1) = x0' * product;
    lambda = eigs(A,1); % Largest magnitute eigenvalue
    
    % Computing k-th step
    for k = 2:maxIt
        x = product;
        x = x/norm(x);
        product = A*x;
        lambdaHist(k) = x' * product;
        convHist(k) = abs(lambdaHist(k) - lambdaHist(k-1)) / abs(lambdaHist(k));
        if convHist(k) <= tol
            flag = 0;
            break; 
        end
    end
end
