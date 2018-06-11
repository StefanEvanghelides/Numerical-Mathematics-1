% Initialization
u_tilde = @(x) sin(pi*x);
f = @(x) pi^2 * u_tilde(x);

mu = 10^-3;
gamma = pi^2 * mu;
p = @(x,t) gamma * sin(pi*x);
v_tilde = @(x,t) (1 + e^(-gamma * t)) * u_tilde(x);
T = 10;
h1 = 1/20;
h2 = 1/40;
u0Func = @(t) zeros(N+1,1); % this is g = [0 0]



% For h1 = 1/2, theta = 0, dt = 0.15625
dt = 0.15625; 
N = T / dt;
theta = 0;
tEnd = T;

[tArray, solArray, nodes] = heatSolveTheta(p, u0Func , mu, theta, tEnd, N, dt);

