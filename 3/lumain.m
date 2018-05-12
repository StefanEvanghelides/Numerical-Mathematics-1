% This script is used to solve the experiment withOUT pivoting

n = 2;
y = [1; 2];
r = n-1;
for i = 1:16
    epsilon = 10^(-i);
    x = [epsilon; 1];
    A = makeVandermondeMatrix(x, r);
    [c_hat, L, U] = luNaive(A, y);
    
    % Relative error
    c_hat
    nrm = norm(c_hat)
    
    % K_2 condition numbers of A
    
    % K_2 condition numbers of L
    
    % K_2 condition numbers of U
    
    % Factorisation error
    
    % Plot of the above 5 quatities
    
    break;
end