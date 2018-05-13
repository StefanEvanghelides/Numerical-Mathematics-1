% INPUT
% lu_function       Either luNaive or luPivot used for testing
% OUTPUT
% epsilon           Values of epsilon
% rel_err           Relative error of the solution
% K2_A              K-2 condition number of A
% K2_L              K-2 condition number of L
% K2_U              K-2 condition number of U
% fact_err          Factorisation error

function [epsilon, rel_err, K2_A, K2_L, K2_U, fact_err] = RUN_lu(lu_function)
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
        [c_hat, L, U] = lu_function(A, y);

        c = A \ y;

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
end