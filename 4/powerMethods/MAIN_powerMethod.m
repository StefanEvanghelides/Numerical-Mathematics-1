% Script file used to test the powerMethod function

N = 10;
A = gallery('poisson', N);
x0 = rand(N^2, 1);
tol = 10^-12;
maxIt = 10^3;

% Computing B
P = diag(diag(A));
alpha = 0.5;

lambda_max = eigs(A,1);
lambda_min = eigs(A,1,'SM');
alpha_opt = 2 / (lambda_max + lambda_min);

B = eye(N^2) - alpha * P\A;

% Running the program
[lambda, x, flag, lambdaHist, convHist] = powerMethod(B, x0, tol, maxIt);
rel_err = abs(lambda - lambdaHist) / abs(lambda);
iterations = size(lambdaHist,2);

%lambda = abs(lambda);
%lambdaHist = abs(lambdaHist);

%%% Plotting %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

% Figure 1
figure('Name','Lambda Approximation','NumberTitle','off');
p1 = loglog(1:iterations, lambdaHist, 'b.-', 'DisplayName', '\lambda^{(K)}'); hold on
p3 = line([1 maxIt],[lambda lambda], 'Color', 'g', 'DisplayName', '\lambda_1');
hold off;
if lambda < 0
    lambda
    lambdaHist(1)
    ylim([lambda*1.3 lambdaHist(1)*0.90]);
else
    ylim([lambdaHist(1)*0.8 lambda*1.3]);
end
title('Lambda approximation');
xlabel('Iteration steps');
ylabel('Lambda Value');
legend([p3 p1], 'Location', 'best');

% Figure 2
figure('Name','Relative error','NumberTitle','off');
loglog(1:iterations, rel_err, 'r', 'DisplayName', 'Relative error');
title('Relative error of the lambda approximation');
xlabel('Iteration steps');
ylabel('Error Value');
legend('Location', 'northeast');
