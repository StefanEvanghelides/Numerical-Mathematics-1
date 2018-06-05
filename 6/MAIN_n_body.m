% Script used for testing the n-body part of the lab

%%                  Two bodies

t0 = 0;
P = 1; %Orbital period
T = 5*P;
tRange = [t0 T];
B = 2;
theta = 1/2;
R = 1;
omega = sqrt(4*pi^2 / (R^3));
x_exact = @(t) R*[cos(omega*t); sin(omega*t); 0];
u_exact = @(t) - (4*pi^2)/(norm(x_exact(t),2)^3) * x_exact(t);
f = @(t,u) twoBodyF(t, [u x_exact(t)]);
x0 = x_exact(0);
u0 = u_exact(0);

figure('Name','Two-Bodies Method Test','NumberTitle','off');
for i = 3:12
  
    h(i) = (2^-i) * P; 
   
    [tArrayRK, solArrayRK] = odeSolveRK(f, tRange, [u0;x0], B, h(i));
    xRK = solArrayRK(:,1);
    yRK = solArrayRK(:,2);
    pRK(i) = plot(xRK, yRK, 'DisplayName', ['RK: h = ', num2str(h(i))]); hold on
    
    solVec = [u0; x0];
    t = 0;
    df = twoBodyJac(t, solVec); 
    [tArrayT, solArrayT] = odeSolveTheta(f, tRange, solVec, df, 1/2, h(i));
    xT = solArrayT(:,1);
    yT = solArrayT(:,2);
    pRK(i) = plot(xT, yT, 'DisplayName', ['\theta: h = ', num2str(h(i))]); hold on
   
end
hold off;
xlabel('x-coordinate');
ylabel('y-coordinate');
title('RK(B=2,R=1) vs \theta=1/2 method');
legend('Location', 'best');







%%                 Jacobian-free method

t0 = 0;
P = 1;
T = 5*P;
tRange = [t0 T];
B = 2;
theta = 1/2;
R = 1;
omega = sqrt(4*pi^2 / (R^3));
x_exact = @(t) R*[cos(omega*t) sin(omega*t) 0]';
u_exact = @(t) - (4*pi^2)/(norm(x_exact(t),2)^3) * x_exact(t);
f(:) = @(t,ux) twoBodyF(t, ux);
x0 = x_exact(0)
u0 = u_exact(0)

h = (2^-10) * P;

% Broyden's method
%df = []; 
%[tArrayB, solArrayB] = odeSolveTheta(f, tRange, u0, df, theta, h);

%figure('Name','Two-Bodies Method Test','NumberTitle','off');
%xB = solArrayB(:,1);
%yB = solArrayB(:,2);
%plot(xB, yB, 'DisplayName', ['Broyden: h = ', num2str(h)]); hold on

% Newton's method
solVec = [u0; x0]
t = 0;
df = @(solVec)twoBodyJac(0, solVec); 
[tArrayN, solArrayN] = odeSolveTheta(f, tRange, solVec, df, theta, h);


% Plotting

xN = solArrayN(:,1);
yN = solArrayN(:,2);
plot(xN, yN, 'DisplayName', ['Newton: h = ', num2str(h)]);
hold off;
xlabel('x-coordinate');
ylabel('y-coordinate');
title('Two-Bodies Method Test');
legend('Location', 'best');



%%                 Solar system

load('solarSimData.mat')
bodyData
bodyMass
velAndPos

[sz, N] = size(velAndPos);

tArray = 0:(1/8760):1;

solVec = reshape(velAndPos, [N*sz 1]);

du = nBodyF(t, solVec, N, bodyMass);

simulateSolarSystem(tArray, du', bodyData);




