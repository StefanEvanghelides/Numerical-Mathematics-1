% Script used to test and run the staticIteration.m function

tol = 10^-12;
maxIt = 125;
maxDepth = 0;
x0 = 0;

f = @(x) cos(x) + 1.1*x;
c1 = -1 / 1.1; % c = -1 / f'(x0) for staticIteration
c2 = -1; % For aitkenIteration
[root1, flag1, convHist1, rootHist1] = staticIteration(f, c1, x0, tol, maxIt);
[root2, flag2, convHist2, rootHist2] = aitkenIteration(f, c2, x0, tol, maxIt, maxDepth);

[~, iterations1] = size(convHist1);
[~, iterations2] = size(convHist2);

%%%%%% Plotting the function f %%%%%%%
figure('Name','Function f','NumberTitle','off');
ax = gca;
x_int = -10:10;
p1 = plot(x_int, f(x_int), 'DisplayName', 'Function f'); hold on
p2 = line([-20 20], [0 0], 'DisplayName', 'xAxis', 'Color', 'k');
p3 = line([0 0], [-20 20], 'DisplayName', 'yAxis', 'Color', 'k');
hold off;
title('Function f');
xlabel('Iteration steps');
ylabel('Value');
legend([p1 p2 p3], 'Location', 'best');

%%%%% Figure 2 %%%%%%%%%%%%
% For staticIteration, The spike is due to the fact that
%   we set x0 = 0.
figure('Name','Relative error','NumberTitle','off');
p1 = plot(1:iterations2, convHist2, 'DisplayName', 'Rel err'); hold on
hold off;
title('Relative error');
xlabel('Iteration steps');
ylabel('Error Value');
legend('Location', 'best');
