% INPUT
% A         square matrix
% b         right hand side
% OUTPUT
% x         solution such that A*x=b
% L         lower triangular matrix such that A = L*U
% U         upper triangular matrix such that A = L*U
function [L, U] = luNaive(A)
    n = length(A);
    L = eye(n); % Identity matrix
    U = A;
    for k = 1 : n
        for i = k+1 : n
            L(i,k) = U(i,k)/U(k,k);
            for j = k : n
               U(i,j) = U(i,j) - L(i,k) * U(k,j);
            end
        end
    end
end