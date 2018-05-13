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
        [temp, r_hat] = max(abs(U(k:n, k)));
        r_hat = r_hat + k - 1;

        % Swap rows in U
        temp = U(k,:);
        U(k,:) = U(r_hat,:);
        U(r_hat,:) = temp;
        
        % Swap rows in L
        temp = L(k,:);
        L(k,:) = L(r_hat,:);
        L(r_hat,:) = temp;
        
        % Swap rows in P
        temp = P(k,:);
        P(k,:) = P(r_hat,:);
        P(r_hat,:) = temp;
        
        % Swap rows in b
        temp = b(k);
        b(k) = b(r_hat);
        b(r_hat) = temp;
        
        for i = k+1 : n
            L(i,k) = U(i,k)/U(k,k);
            for j = k : n
               U(i,j) = U(i,j) - L(i,k) * U(k,j);
            end
        end
        L(k,k) = 1;
    end
    
    % Computing x based on L, U and b:
    y = L \ b;
    x = U \ y;
end