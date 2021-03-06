% Script used to test and run the staticIteration.m function

tol = 10^-12;
maxIt = 25;
maxDepth = 0;
x0 = 0;

f = @(x) cos(x) + 1.1*x;
df = @(x) -sin(x) + 1.1;
c_static = -1 / 1.1; % c = -1 / f'(x0) for staticIteration
c_aitken = -1; % For aitkenIteration

convHist = zeros(8, maxIt);
rootHist = zeros(8, maxIt);

[root_s, flag_s, convHist_s, rootHist_s] = staticIteration(f, c_static, x0, tol, maxIt); 
[~, iterations_s] = size(convHist_s);

% Aitken static Iterations with depth 0..3 and
% Newton Iterations with depth 0..3
c_funct = @(x) -1/df(x); % Note, this should be a function handle
for i = 1:4
   [root(i), flag(i), convHist(i,:), rootHist(i,:)] = aitkenIteration(f, c_aitken, x0, tol, maxIt, i-1); 
   [root(i+4), flag(i+4), convHist(i+4,:), rootHist(i+4,:)] = aitkenIteration(f, c_funct, x0, tol, maxIt, i-1);
end

% Getting the number of iterations
for i = 1:8
    [~, iterations(i)] = size(convHist(i,:));
end

% Getting the relative error
alpha = -0.69704098638574585;
for i = 1:2
    error(i,:) = abs(rootHist(i,:) - alpha);
    rel_err(i,:) = abs(error(i,1:end-1) - convHist(i,2:end)) ./ error(i,1:end-1);
end


%%%%% Plotting the error estimates %%%%%%%%%%%%
% For staticIteration, The spike is due to the fact that we set x0 = 0.
figure('Name','Error Estimate','NumberTitle','off');
for i = 1:4
    colorStep = (i-1) * 0.33;
    p(i) = semilogy(1:iterations(i), convHist(i,:), 'DisplayName', ['Static \phi_{\Delta}^{(', int2str(i-1),')}'], 'Color', [1, colorStep, 0]); hold on
    p(i+4) = semilogy(1:iterations(i+4), convHist(i+4,:), 'DisplayName', ['Newton \phi_{\Delta}^{(', int2str(i-1),')}'], 'Color', [0, colorStep, 1-colorStep]);
end
%p(9) = semilogy(1:iterations_s, convHist_s, 'DisplayName', 'StaticIter', 'Color', 'k');
hold off;
title('Error Estimate');
xlabel('Iteration steps');
ylabel('Estimated error');
legend(p(1:8), 'Location', 'best');

%%%%% Plotting the relative error %%%%%%%%%%%%
figure('Name','Relative error','NumberTitle','off');
semilogy(1:iterations(1)-1, rel_err(1,:), 'DisplayName', 'Error \phi_{\Delta}^{(0)}'); hold on
semilogy(1:iterations(2)-1, rel_err(2,:), 'DisplayName', 'Error \phi_{\Delta}^{(1)}');
hold off;
title('Relative Error');
xlabel('Iteration steps');
ylabel('Rel Err');
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