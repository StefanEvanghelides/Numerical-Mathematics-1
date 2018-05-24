% Script used to test and run the staticIteration.m function

tol = 10^-12;
maxIt = 125;
maxDepth = 0;
x0 = 0;

f = @(x) cos(x) + 1.1*x;
c1 = -1 / 1.1; % c = -1 / f'(x0) for staticIteration
c2 = -1; % For aitkenIteration

% For testing purposes we will compare staticIteration and aitkenIteration
% with depth = 0
[root_test_s, flag_test_s, convHist_test_s, rootHist_test_s] = ...
    staticIteration(f, c1, x0, tol, maxIt);
[root_test_a, flag_test_a, convHist_test_a, rootHist_test_a] = ...
    aitkenIteration(f, c2, x0, tol, maxIt, 0);

% Aitken static Iterations 0..3
[root1, flag1, convHist1, rootHist1] = aitkenIteration(f, c1, x0, tol, maxIt, 0);
[root2, flag2, convHist2, rootHist2] = aitkenIteration(f, c2, x0, tol, maxIt, 1);
[root3, flag3, convHist3, rootHist3] = aitkenIteration(f, c2, x0, tol, maxIt, 2);
[root4, flag4, convHist4, rootHist4] = aitkenIteration(f, c2, x0, tol, maxIt, 3);

% Newton Iterations 0..3
c_funct = @(x) x+1; % Note, this should be a function handle
[root5, flag5, convHist5, rootHist5] = aitkenIteration(f, c_funct, x0, tol, maxIt, 0);
[root6, flag6, convHist6, rootHist6] = aitkenIteration(f, c_funct, x0, tol, maxIt, 1);
[root7, flag7, convHist7, rootHist7] = aitkenIteration(f, c_funct, x0, tol, maxIt, 2);
[root8, flag8, convHist8, rootHist8] = aitkenIteration(f, c_funct, x0, tol, maxIt, 3);


[~, iterations1] = size(convHist1);
[~, iterations2] = size(convHist2);
[~, iterations3] = size(convHist3);
[~, iterations4] = size(convHist4);
[~, iterations5] = size(convHist5);
[~, iterations6] = size(convHist6);
[~, iterations7] = size(convHist7);
[~, iterations8] = size(convHist8);


%%%%% Plotting the relative errors %%%%%%%%%%%%
% For staticIteration, The spike is due to the fact that we set x0 = 0.
figure('Name','Relative error','NumberTitle','off');
plot(1:iterations1, convHist1, 'DisplayName', 'Rel err1'); hold on
plot(1:iterations2, convHist2, 'DisplayName', 'Rel err2');
plot(1:iterations3, convHist3, 'DisplayName', 'Rel err3');
plot(1:iterations4, convHist4, 'DisplayName', 'Rel err4');
plot(1:iterations5, convHist5, 'DisplayName', 'Rel err5');
plot(1:iterations6, convHist6, 'DisplayName', 'Rel err6');
plot(1:iterations7, convHist7, 'DisplayName', 'Rel err7');
plot(1:iterations8, convHist8, 'DisplayName', 'Rel err8');
hold off;
title('Relative error');
xlabel('Iteration steps');
ylabel('Error Value');
legend('Location', 'best');

%%%%%% Plotting the function f %%%%%%%
figure('Name','Function f','NumberTitle','off');
ax = gca;
x_range = -5:5;
p1 = plot(x_range, f(x_range)); hold on
p2 = line([-6 6], [0 0], 'Color', 'k');
p3 = line([0 0], [-6 6], 'Color', 'k');
hold off;
title('Function f');
xlabel('x');
ylabel('f(x)');
legend('f(x) = cos(x) + 1.1x', 'Location', 'best');