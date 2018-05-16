
%Construct the data points and initialize
x = zeros(21,1);
y = zeros(21,1);
for i = 1:21
   x(i) = (i-1)/20;
   y(i) = x(i)^8;
end
% Exact solution
e = [0 0 0 0 0 0 0 0 1].';
% Error vectors
rel_err_normal  = zeros(16,1);
upp_err_normal  = zeros(16,1);
rel_err_QR      = zeros(16,1);
upp_err_QR      = zeros(16,1);
epsilon         = zeros(16,1);

% Calculate K_2
A = makeVandermondeMatrix(x,8);
disp(cond(A.' * A,2));
[Q, R] = qr(A,0);
disp(cond(R,2));

% Run the experiments
for i = 1:16
    epsilon(i) = 10^-i;
    x_error = (2*epsilon(i)).*rand(21,1) - epsilon(i);
    y_error = (2*epsilon(i)).*rand(21,1) - epsilon(i);
    x_perturbed = x + x_error;
    y_perturbed = y + y_error;
    
    A = makeVandermondeMatrix(x_perturbed,8);
    % Solve regular normal equation
    c_normal = (A.'*A) \ (A.'*y);
    % Calculate relative error for normal equation
<<<<<<< HEAD
    rel_err_normal(i) = sum(norm(c_normal - e)/norm(c_normal));
=======
>>>>>>> 25f5e2713d33f0465c833e55c8cd4b37c6017f84
    % Calculate upper bound for error
    upp_err_normal(i) = (cond(A.'*A)*(norm(y_perturbed)/norm(y)));
    upp_err_normal(i) = (cond(A.'*A)*(norm(y_perturbed)/norm(y)))
    
    % Calculate QR factorization
    [Q, R] = qr(A,0);
    % Solve QR equation
    c_QR = R \ (Q.'*y);
    % Calculate relative error for QR factorization
<<<<<<< HEAD
    rel_err_QR(i) = sum(norm(c_QR - e)/(norm(c_QR)));
=======
>>>>>>> 25f5e2713d33f0465c833e55c8cd4b37c6017f84
    % Calculate upper bound for error
    upp_err_QR(i) = (cond(R)*(norm(y_perturbed)/norm(y)));
    upp_err_QR(i) = (cond(R)*(norm(y_perturbed)/norm(y)))

end
loglog(epsilon,rel_err_normal, '-s');
hold on
loglog(epsilon,upp_err_normal, '-s');
loglog(epsilon,rel_err_QR, '-s');
loglog(epsilon,upp_err_QR, '-s');
ylabel('relative error of solutions and upper bounds')
xlabel('\epsilon')
grid on;
legend({'Normal error', 'Normal upper bound', 'QR error', 'QR upper bound'}, 'Location', 'southwest');
set(gca, 'XDir','reverse');
title('Least square method errors');
hold off