% Script file used to test the powerMethod function

N = 10;
A = gallery('poisson', N);
x0 = rand(N^2, 1);
tol = 10^-12;
maxIt = 10^3;

[lambda, x, flag, lambdaHist, convHist] = powerMethod(A, x0, tol, maxIt);

rel_err = abs(lambda - lambdaHist) / abs(lambda);
size_lambda_hist = size(lambdaHist,2)
flag
lambda
lambdaHist(size_lambda_hist)
convHist(size_lambda_hist)

loglog(1:size_lambda_hist, lambdaHist, 'b.-', 'DisplayName', '\lambda^{(K)}'); hold on
loglog(1:size_lambda_hist, convHist, 'r', 'DisplayName', 'error estimate')
line([1 maxIt],[lambda lambda], 'Color', 'g', 'DisplayName', '\lambda_1')
hold off;
%ylim([-inf lambda*1.1]); % Increase y-azis space by 10%
title('Lambda approximation');
legend('Location', 'best');
