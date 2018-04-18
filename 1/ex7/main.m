% Exercise 7 - plotting

addpath('../');

f = @sin_2_pi;
plot = fplot(f, [0,2], 'ro-');
title('Test plot');
xlabel('Something on x-axis');
ylabel('Something on y-axis');
legend('Legend');