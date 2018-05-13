% INPUT
% A         square matrix
% b         right hand side
% OUTPUT
% x         solution such that A*x=b
% L         lower triangular matrix such that A = L*U
% U         upper triangular matrix such that A = L*U
% P         permutation matrix
function [x, L, U, P] = luPivot(A, b)
    % Computing L and U
    n = length(A);
    P = eye(n);
    L = zeros(n);
    U = A;
    for k = 1 : n
        % Find r_hat such that |U(r_hat,k)| = max (r=k,...,n) |U(r,k)|
        
        % Swap r_hat-th row with the r-th row in L, U and P
        
        for i = k+1 : n
            L(i,k) = U(i,k)/U(k,k);
            for j = k : n
               U(i,j) = U(i,j) - L(i,k) * U(k,j);
            end
        end
    end
    L(k,k) = 1;
    
    % Computing x based on L, U and b:
    y = L \ b;
    x = U \ y;
end