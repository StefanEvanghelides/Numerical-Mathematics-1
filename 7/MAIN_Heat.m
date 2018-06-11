% Initialization
u_tilde = @(x) sin(pi*x);
f = @(x) pi^2 * u_tilde(x);

mu = 10^-3;
gamma = pi^2 * mu;
p = @(x,t) gamma * sin(pi*x);
v_tilde = @(x,t) (1 + exp(-gamma * t)) * u_tilde(x);
T = 1000;
u0Func = @(t) 0; % this is g = [0 0]
h1 = 1/20;
h2 = 1/40;

theta = zeros(7,1);
dt = zeros(7,1);
theta_mod = zeros(7,1);
epsilon_h1 = zeros(7,1);
epsilon_h2 = zeros(7,1);


% Theta = 0, dt = 0.15625
%   For h = 1/20
dt(1) = 0.15625;
N = T / dt(1);
theta(1) = 0;
tEnd = T;


%[~, solArray, nodes] = heatSolveTheta(p, u0Func , mu, theta(1), tEnd, N, dt(1));
%error = abs(solArray(end,:) - v_tilde(nodes,tEnd));
%max_error1 = max(error);




% Theta = 0, dt = 0.3125
%   For h = 1/20
dt(2) = 0.3125;
N = T / dt(2);
theta(2) = 0;


% Theta = 0, dt = 0.3225
%   For h = 1/20
dt(3) = 0.3225;
N = T / dt(3);
theta(3) = 0;



% Theta = 1/2, dt = 100
%   For h = 1/20
dt(4) = 100;
N = T / dt(4);
theta(4) = 1/2;

% Theta = 1/2, dt = 200
%   For h = 1/20
dt(5) = 200;
N = T / dt(5);
theta(5) = 1/2;



% Theta = 1, dt = 100
%   For h = 1/20
dt(6) = 100;
N = T / dt(6);
theta(6) = 1;


% Theta = 1, dt = 200
%   For h = 1/20
dt(7) = 200;
N = T / dt(7);
theta(7) = 1;


% Table
array2table ([theta, dt, theta_mod, epsilon_h1, epsilon_h2,], ...
    'VariableNames', {'theta', 'dt', 'var', 'epsilon_h1_T', 'epsilon_h2_T'})



% Plot the temperature
x = 1:10;
y = 1:10;
A = x'*y;
colormap('default')
imagesc(A)
colorbar