% Exercise 9

digits(20); % set variable precision to 20 digits

X = 2.^(1:16);

error = approx_pi_compare(X, @approx_pi_Basel, @approx_pi_Buffon);

% Plotting
plot(1:16, error);
line([1,16], [0,0], 'Color', 'k');
title('Title');
xlabel('xLabel');
ylabel('ylabel');
legend('First', 'Second', 'Horizontal Line');


