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
   
    [tArray, solArray] = odeSolveRK(f, tRange, u0, B, h(i));
    
    x = solArray(:,1);
    y = solArray(:,2);
    
    pRK(i) = plot(x, y, 'DisplayName', ['RK: h = ', num2str(h(i))]); hold on
   
end
hold off;
xlabel('x-coordinate');
ylabel('y-coordinate');
title('Two-Bodies Method Test');
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
x_exact = @(t) R*[cos(omega*t) sin(omega*t) 0];
u_exact = @(t) - (4*pi^2)/(norm(x_exact(t),2)^3) * x_exact(t);
f(:) = @(t,u) twoBodyF(t, [u x_exact(t)]);
x0 = x_exact(0);
u0 = u_exact(0);

h = (2^-10) * P;

df = []; % Broyden's method
[tArray1, solArray1] = odeSolveTheta2(f, tRange, u0, df, theta, h);

%solVec = [u0 x0];
%t = 0;
%df = twoBodyF(t, solVec); % Newton's method
%[tArray2, solArray2] = odeSolveTheta2(f, tRange, u0, df, theta, h);

x = solArray1(:,1);
y = solArray1(:,2);
plot(x, y, 'DisplayName', ['\theta: h = ', num2str(h)]); hold on

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


%tArray = ;
%solArray = ;
%bodyData = ;

%t = ;
%solVec = ;
%N = ;
%mass = ;

%du = nBody(t, solVec, N, mass);

solVec = velAndPos;

solArray = reshape(solVec, [N*sz 1]);
simulateSolarSystem(tArray, solArray, bodyData);




