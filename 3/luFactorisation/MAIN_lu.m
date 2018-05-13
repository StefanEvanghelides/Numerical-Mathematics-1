% Main Script used to plot the results of the 2 types of LU factorisations
% It makes use of RUN_lu function, which takes as an input
%    a function handle: either luNaive or luPivot

% NOTE: this variable should be either @luNaive or @luPivot
lu_function_handle = @luNaive;

[epsilon, rel_err, K2_A, K2_L, K2_U, fact_err] = RUN_lu(lu_function_handle);

loglog(epsilon, rel_err, 'c-s', 'DisplayName', 'Rel err');
hold on
loglog(epsilon, K2_A, 'b- .', 'DisplayName', 'K_2(A)') 
loglog(epsilon, K2_L, 'r--s', 'DisplayName', 'K_2(L)')
loglog(epsilon, K2_U, 'g- .', 'DisplayName', 'K_2(U)')
loglog(epsilon, fact_err, 'k-s', 'DisplayName', 'Fact err')
hold off
set(gca, 'XDir','reverse');
ylim([-inf 3.3]);
title(['Error for ' func2str(lu_function_handle)]);
xlabel('Epsilon');
ylabel('Errors');
legend('Location', 'east');