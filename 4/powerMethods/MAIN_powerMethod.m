% Script file used to test the powerMethod function

N = 10;
A = gallery('poisson', N);
x0 = rand(N^2, 1);
tol = 10^-12;
maxIt = 10^3;

% Computing B
P = diag(diag(A));
lambda_max = eigs(A,1);
lambda_min = eigs(A,1,'SM');
alpha_opt = 2 / (lambda_max + lambda_min);
alpha = 0.5;

B = eye(N^2) - alpha_opt * P\A;

% Running the program
[lambda, x, flag, lambdaHist, convHist] = powerMethod(B, x0, tol, maxIt);
lambda = abs(lambda);
lambdaHist = abs(lambdaHist);
rel_err = abs(lambda - lambdaHist) / abs(lambda);
iterations = size(lambdaHist,2);


% Plotting 

p1 = loglog(1:iterations, lambdaHist, 'b.-', 'DisplayName', '\lambda^{(K)}'); hold on
%p2 = loglog(1:iterations, rel_err, 'r', 'DisplayName', 'error estimate');
p3 = line([1 maxIt],[lambda lambda], 'Color', 'g', 'DisplayName', '\lambda_1');
hold off;
if lambda < 0
    ylim([lambda*1.3 lambdaHist(1)*0.8]);
else
    ylim([lambdaHist(1)*0.8 lambda*1.3]);
end
title('Lambda approximation');
xlabel('Iteration steps');
ylabel('Value');
legend([p3 p1], 'Location', 'best');
