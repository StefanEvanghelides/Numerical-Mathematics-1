% This script is used to solve the experiment withOUT pivoting

n = 2;
y = [1; 2];
r = n-1;
for i = 1:16
    epsilon(i) = 10^-i;
    
    x = [epsilon(i); 1];
    A = makeVandermondeMatrix(x, r);
    [c_hat, L, U] = luNaive(A, y);
    
    % Relative error
    %rel_err(i) = norm(c - c_est)/norm(c);
    
    % K condition numbers of A
    K2_A(i) = cond(A, 2);
    
    % K_2 condition numbers of L
    K2_L(i) = cond(L,2);
    
    % K_2 condition numbers of U
    K2_U(i) = cond(U,2);
    
    % Factorisation error
    fact_err(i) = norm(A - L*U, 'fro');
    
end

% Plot of the above 5 quatities
log_h = logspace(0, 16, 16);
loglog(log_h, K2_A, 'b- .'); hold on;
loglog(log_h, K2_L, 'r--s');
loglog(log_h, K2_U, 'g- .');
loglog(log_h, fact_err, 'k-s');
%loglog(log_h, rel_err);
title('Title');
xlabel('x label');
ylabel('y label');
legend('K2_A', 'K2_L', 'K2_U', 'Factorization error');
