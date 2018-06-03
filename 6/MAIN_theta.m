% Script used to run odeSolveTheta

% Metadata
t0 = 0;
T = 10;
tRange = [t0 T];
% Nh = 1000;
% h = (T-t0)/Nh;

% Function initialization
y = @(t) exp(lambda*t) + sin(t);
f = @(t,u) lambda*(u - sin(t)) + cos(t);
u0 = y(0);
df = @(t) -sin(t) - lambda*cos(t);


%%%%%%%%%% COMPARISON Part 1 %%%%%%%%%%%%%

lambda = -100;
for i=1:7
   h = 2*10^-2 + (i-4)*10^-4;
   hL = h*lambda
   [tArray1, solArray1] = odeSolveTheta(f, tRange, u0, df, 0, h);
   [tArray2, solArray2] = odeSolveTheta(f, tRange, u0, df, 1/2, h);
   [tArray3, solArray3] = odeSolveTheta(f, tRange, u0, df, 1, h);
   
   x = t0:h:T;
   plot(x, solArray1, 'DisplayName', ['\theta(',int2str(i),') = 0']); hold on
   plot(x, solArray2, 'DisplayName', ['\theta(',int2str(i),') = 1/2']);
   plot(x, solArray3, 'DisplayName', ['\theta(',int2str(i),') = 1']);
end
hold off;
xlabel('');
ylabel('');
title('');
legend('Location', 'best');
