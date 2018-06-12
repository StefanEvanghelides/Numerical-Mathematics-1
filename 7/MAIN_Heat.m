%%               Test Problem

u_tilde = @(x) sin(pi*x);

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


% idx = 1, Theta = 0, dt = 0.15625
idx = 1;
dt(idx) = 0.15625;
theta(idx) = 0;

u0Func = @(t) zeros(ceil(T/dt(idx))+1,1); % this is g = [0 0]
theta_mod(idx) = mu * dt(idx) / h2^2;

N = 1/h1 - 1;
[~, solArray, nodes] = heatSolveTheta(p, u0Func , mu, theta(idx), T, N, dt(idx));
nodes = [0; nodes; 1];
error = abs(solArray(end,:) - v_tilde(nodes,T)');
epsilon_h1(idx) = max(error);
%PLOT_temperature(solArray, theta(idx), dt(idx), N);

N = 1/h2 - 1;
[~, solArray, nodes] = heatSolveTheta(p, u0Func , mu, theta(idx), T, N, dt(idx));
nodes = [0; nodes; 1];
error = abs(solArray(end,:) - v_tilde(nodes,T)');
epsilon_h2(idx) = max(error);
%PLOT_temperature(solArray, theta(idx), dt(idx), N);



% idx = 2, Theta = 0, dt = 0.3125
idx = 2;
dt(idx) = 0.3125;
theta(idx) = 0;

u0Func = @(t) zeros(ceil(T/dt(idx))+1,1); % this is g = [0 0]
theta_mod(idx) = mu * dt(idx) / h2^2;

N = 1/h1 - 1;
[~, solArray, nodes] = heatSolveTheta(p, u0Func , mu, theta(idx), T, N, dt(idx));
nodes = [0; nodes; 1];
error = abs(solArray(end,:) - v_tilde(nodes,T)');
epsilon_h1(idx) = max(error);
%PLOT_temperature(solArray, theta(idx), dt(idx), N);

N = 1/h2 - 1;
[~, solArray, nodes] = heatSolveTheta(p, u0Func , mu, theta(idx), T, N, dt(idx));
nodes = [0; nodes; 1];
error = abs(solArray(end,:) - v_tilde(nodes,T)');
epsilon_h2(idx) = max(error);
%PLOT_temperature(solArray, theta(idx), dt(idx), N);



% idx = 3, Theta = 0, dt = 0.3225
idx = 3;
dt(idx) = 0.3225;
theta(idx) = 0;

u0Func = @(t) zeros(ceil(T/dt(idx))+1,1); % this is g = [0 0]
theta_mod(idx) = mu * dt(idx) / h2^2;

N = 1/h1 - 1;
[~, solArray, nodes] = heatSolveTheta(p, u0Func , mu, theta(idx), T, N, dt(idx));
nodes = [0; nodes; 1];
error = abs(solArray(end,:) - v_tilde(nodes,T)');
epsilon_h1(idx) = max(error);
PLOT_temperature(solArray, theta(idx), dt(idx), N);

N = 1/h2 - 1;
[~, solArray, nodes] = heatSolveTheta(p, u0Func , mu, theta(idx), T, N, dt(idx));
nodes = [0; nodes; 1];
error = abs(solArray(end,:) - v_tilde(nodes,T)');
epsilon_h2(idx) = max(error);
PLOT_temperature(solArray, theta(idx), dt(idx), N);




% idx = 4, Theta = 1/2, dt = 100
idx = 4;
dt(idx) = 100;
theta(idx) = 1/2;

u0Func = @(t) zeros(ceil(T/dt(idx))+1,1); % this is g = [0 0]
theta_mod(idx) = mu * dt(idx) / h2^2;

N = 1/h1 - 1;
[~, solArray, nodes] = heatSolveTheta(p, u0Func , mu, theta(idx), T, N, dt(idx));
nodes = [0; nodes; 1];
error = abs(solArray(end,:) - v_tilde(nodes,T)');
epsilon_h1(idx) = max(error);
%PLOT_temperature(solArray, theta(idx), dt(idx), N);

N = 1/h2 - 1;
[~, solArray, nodes] = heatSolveTheta(p, u0Func , mu, theta(idx), T, N, dt(idx));
nodes = [0; nodes; 1];
error = abs(solArray(end,:) - v_tilde(nodes,T)');
epsilon_h2(idx) = max(error);
%PLOT_temperature(solArray, theta(idx), dt(idx), N);




% idx = 5, Theta = 1/2, dt = 200
idx = 5;
dt(idx) = 200;
theta(idx) = 1/2;

u0Func = @(t) zeros(ceil(T/dt(idx))+1,1); % this is g = [0 0]
theta_mod(idx) = mu * dt(idx) / h2^2;

N = 1/h1 - 1;
[~, solArray, nodes] = heatSolveTheta(p, u0Func , mu, theta(idx), T, N, dt(idx));
nodes = [0; nodes; 1];
error = abs(solArray(end,:) - v_tilde(nodes,T)');
epsilon_h1(idx) = max(error);
%PLOT_temperature(solArray, theta(idx), dt(idx), N);

N = 1/h2 - 1;
[~, solArray, nodes] = heatSolveTheta(p, u0Func , mu, theta(idx), T, N, dt(idx));
nodes = [0; nodes; 1];
error = abs(solArray(end,:) - v_tilde(nodes,T)');
epsilon_h2(idx) = max(error);
%PLOT_temperature(solArray, theta(idx), dt(idx), N);




% idx = 6, Theta = 1, dt = 100
idx = 6;
dt(idx) = 100;
theta(idx) = 1;

u0Func = @(t) zeros(ceil(T/dt(idx))+1,1); % this is g = [0 0]
theta_mod(idx) = mu * dt(idx) / h2^2;

N = 1/h1 - 1;
[~, solArray, nodes] = heatSolveTheta(p, u0Func , mu, theta(idx), T, N, dt(idx));
nodes = [0; nodes; 1];
error = abs(solArray(end,:) - v_tilde(nodes,T)');
epsilon_h1(idx) = max(error);
%PLOT_temperature(solArray, theta(idx), dt(idx), N);

N = 1/h2 - 1;
[~, solArray, nodes] = heatSolveTheta(p, u0Func , mu, theta(idx), T, N, dt(idx));
nodes = [0; nodes; 1];
error = abs(solArray(end,:) - v_tilde(nodes,T)');
epsilon_h2(idx) = max(error);
%PLOT_temperature(solArray, theta(idx), dt(idx), N);




% idx = 7, Theta = 1, dt = 200
idx = 7;
dt(idx) = 200;
theta(idx) = 1;

u0Func = @(t) zeros(ceil(T/dt(idx))+1,1); % this is g = [0 0]
theta_mod(idx) = mu * dt(idx) / h2^2;

N = 1/h1 - 1;
[~, solArray, nodes] = heatSolveTheta(p, u0Func , mu, theta(idx), T, N, dt(idx));
nodes = [0; nodes; 1];
error = abs(solArray(end,:) - v_tilde(nodes,T)');
epsilon_h1(idx) = max(error);
%PLOT_temperature(solArray, theta(idx), dt(idx), N);

N = 1/h2 - 1;
[~, solArray, nodes] = heatSolveTheta(p, u0Func , mu, theta(idx), T, N, dt(idx));
nodes = [0; nodes; 1];
error = abs(solArray(end,:) - v_tilde(nodes,T)');
epsilon_h2(idx) = max(error);
%PLOT_temperature(solArray, theta(idx), dt(idx), N);




% Table
array2table ([theta, dt, theta_mod, epsilon_h1, epsilon_h2,], ...
    'VariableNames', {'theta', 'dt', 'theta_mod', 'epsilon_h1_T', 'epsilon_h2_T'})






%%                Application Problem

u_tilde = @(x) sin(pi*x);
f = @(x) pi^2 * u_tilde(x);

mu = 80.4 / (450 * 7874);
gamma = pi^2 * mu;
p = @p_func;
v_tilde = @(x,t) (1 + exp(-gamma * t)) * u_tilde(x);
T = 100;
T_star = 1811;
h = 10^-3;

dt = 0.02;
u0Func = @(t) 293 * ones(T/dt+1,1); % this is g = [0 0]
N = 1/h - 1;
theta = 0;

[~, solArray, nodes] = heatSolveTheta(p, u0Func , mu, theta, T, N, dt);
PLOT_temperature(solArray, theta, dt, N);
[len, ~] = size(solArray);
time_needed = len;
for i = 1:len
   if max(solArray(i,:)) > T_star
       time_needed = i;
       break;
   end
end

if time_needed == len
    disp('Melting point not reached in time');
else
    disp(['Melting point reached after: ', num2str(time_needed)]);
end