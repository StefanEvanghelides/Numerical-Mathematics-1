t0 = 0;
T = 10;
Nh = 5000;

lambda = 1;
y = @(t) exp(lambda*t) + sin(t);
f = @(t,u) lambda*(u - sin(t)) + cos(t);
tRange = [t0 T];
u0 = y(0);
df = 1;
theta = 0;
h = (T-t0)/Nh;

%Compare with the exact solution
idx = 1; 
for t = t0:h:T
    solExact(idx) = y(t);
    idx = idx + 1;
end

[tArray, solArray] = odeSolveTheta(f, tRange, u0, df, theta, h);


%%%%%%%%%% Plotting function y %%%%%%%%%%%
x = t0:h:T;
plot(x, y(x), 'DisplayName', 'y'); hold on
plot(x, solArray, 'DisplayName', 'u');
legend('Location', 'best');
