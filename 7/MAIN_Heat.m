
%%               Test Problem

u_tilde = @(x) sin(pi*x);
f = @(x) pi^2 * u_tilde(x);

mu = 10^-3;
gamma = pi^2 * mu;
p = @(x,t) gamma * sin(pi*x);
v_tilde = @(x,t) (1 + exp(-gamma * t)) * u_tilde(x);
T = 1000;
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
u0Func = @(t) zeros(T/dt(1)+1,1); % this is g = [0 0]
theta(1) = 0;
tEnd = T;
N = 1/h1 - 1;


[~, solArray, nodes] = heatSolveTheta(p, u0Func , mu, theta(1), tEnd, N, dt(1));
nodes = [0; nodes; 1];
error = abs(solArray(end,:) - v_tilde(nodes,tEnd)');
max_error1 = max(error);




% Theta = 0, dt = 0.3125
%   For h = 1/20
dt(2) = 0.3125;
theta(2) = 0;


% Theta = 0, dt = 0.3225
%   For h = 1/20
dt(3) = 0.3225;
theta(3) = 0;



% Theta = 1/2, dt = 100
%   For h = 1/20
dt(4) = 100;
theta(4) = 1/2;

% Theta = 1/2, dt = 200
%   For h = 1/20
dt(5) = 200;
theta(5) = 1/2;



% Theta = 1, dt = 100
%   For h = 1/20
dt(6) = 100;
theta(6) = 1;


% Theta = 1, dt = 200
%   For h = 1/20
dt(7) = 200;
theta(7) = 1;


% Table
array2table ([theta, dt, theta_mod, epsilon_h1, epsilon_h2,], ...
    'VariableNames', {'theta', 'dt', 'var', 'epsilon_h1_T', 'epsilon_h2_T'})


% Plot the surface of the results
figure('Name', 'Surface of the temperature', 'NumberTitle', 'off');
surf(solArray);

% Plot the temperature
figure('Name', 'Temperature plot', 'NumberTitle', 'off');
colormap('default')
imagesc(solArray)
colorbar



%%                Application Problem

u_tilde = @(x) sin(pi*x);
f = @(x) pi^2 * u_tilde(x);

mu = 80.4 / (450 * 7874);
P_star = 2 * 10^7 / (450 * 7874);
gamma = pi^2 * mu;
p = @p_funct;
v_tilde = @(x,t) (1 + exp(-gamma * t)) * u_tilde(x);
T = 600;
h = 10^-3;

dt = 1;
u0Func = @(t) 293 * ones(T/dt(1)+1,1); % this is g = [0 0]
theta(1) = 0;
tEnd = T;
N = 1/h1 - 1;
