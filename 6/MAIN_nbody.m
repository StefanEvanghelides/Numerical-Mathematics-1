% Script used for testing the n-body part of the lab

%%                 Two bodies

t0 = 0;
P = 1; %Orbital period
T = 5*P;
f = @(t,u) twoBodyF(t, solVec);
tRange = [t0 T];
B = 2;
theta = 1/2;
R = 1;
omega = sqrt(4*pi^2 / (R^3));
x_exact = @(t) R*[cos(omega*t); sin(omega*t); 0];
u_exact = @(t) - (4*pi^2)/(norm(x_exact(t),2)^3) * x_exact(t);
x0 = x_exact(0);
u0 = u_exact(0);

for i = 3:12
   h(i) = (2^-i) * P; 
   
   [tArray, solArray] = odeSolveRK(f, tRange, u0, B, h(i));
   
   
end







%%                 Jacobian-free method








%%                 Solar system

%tArray = ;
%solArray = ;
%bodyData = ;

%t = ;
%solVec = ;
%N = ;
%mass = ;

%du = nBody(t, solVec, N, mass);

solVec = [1 2 3 4 5 6; 1 2 3 4 5 6; 1 2 3 4 5 6];

solArray = reshape(solVec, [N*no 1]);
simulateSolarSystem(tArray, solArray, bodyData);



