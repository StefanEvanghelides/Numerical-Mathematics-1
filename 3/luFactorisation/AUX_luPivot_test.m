% This script is used to solve the experiment WITH pivoting

n = 2;
y = [1; 2];
r = n-1;
epsilon = zeros(1,16);
rel_err = zeros(1,16);
K2_A = zeros(1,16);
K2_L = zeros(1,16);
K2_U = zeros(1,16);
fact_err = zeros(1,16);
for i = 1:16
    epsilon(i) = 10^-i;
    
    x = [epsilon(i); 1];
    A = makeVandermondeMatrix(x, r);
    [c_hat, L, U, P] = luPivot(A, y);
    
    c = c_hat;
    
    % Relative error
    rel_err(i) = norm(c_hat - c)/norm(c);
    
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

loglog(epsilon, rel_err, 'c-s', 'DisplayName', 'Rel err');
hold on
loglog(epsilon, K2_A, 'b- .', 'DisplayName', 'K_2(A)') 
loglog(epsilon, K2_L, 'r--s', 'DisplayName', 'K_2(L)')
loglog(epsilon, K2_U, 'g- .', 'DisplayName', 'K_2(U)')
loglog(epsilon, fact_err, 'k-s', 'DisplayName', 'Fact err')
hold off
set(gca, 'XDir','reverse');
ylim([-inf 3.3]);
title('Error for luPivot');
xlabel('Epsilon');
ylabel('Errors');
legend('Location', 'east');
