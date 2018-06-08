% Initialization
g = [0 0];
mu = 10^-3;
p = @(x,t) pi^2*mu*sin(pi*x);
T = 1000;
h1 = 1/20;
h2 = 1/40;
u0Func = @(t) 0;
theta = 1/2;
tEnd = 10;
dt = 1/T;
N = 998;

heatSolveTheta(p, u0Func , mu, theta, tEnd, N, dt)

