% Script used to run the 2 Parts of the Theta-Method Problem


%%               COMPARISON Part 1       

disp('Stability Test with Lambda = -100');

t0 = 0;
T = 10;
tRange = [t0 T];
lambda = -100;
y = @(t) exp(lambda*t) + sin(t);
f = @(t,u) lambda*(u - sin(t)) + cos(t);
u0 = y(0);
df = @(t) -sin(t) - lambda*cos(t);

figure('Name','Theta Method Stability Test','NumberTitle','off');
for i=1:7
    h(i) = 2*10^-2 + (i-4)*10^-4;
    [tArray11, solArray11] = odeSolveTheta(f, tRange, u0, df, 0, h(i));
    [tArray12, solArray12] = odeSolveTheta(f, tRange, u0, df, 1/2, h(i));
    [tArray13, solArray13] = odeSolveTheta(f, tRange, u0, df, 1, h(i));
   
    x = t0:h(i):T;
    pTheta_FE(i) = plot(x, solArray11, 'DisplayName', ['\theta(',int2str(i),') = 0']); hold on
    pTheta_CN(i) = plot(x, solArray12, 'DisplayName', ['\theta(',int2str(i),') = 1/2']);
    pTheta_BE(i) = plot(x, solArray13, 'DisplayName', ['\theta(',int2str(i),') = 1']);
end
hold off;
xlabel('interval');
ylabel('Solution Arrays');
title('\theta Method Stability Test');
legend([pTheta_FE, pTheta_CN, pTheta_BE], 'Location', 'best');

hLambda = h*lambda
h



%%               COMPARISON Part 2  
disp('Accuracy Test with Lambda = -1');

t0 = 0;
T = 10;
tRange = [t0 T];
lambda = -1;
y = @(t) exp(lambda*t) + sin(t);
f = @(t,u) lambda*(u - sin(t)) + cos(t);
u0 = y(0);
df = @(t) -sin(t) - lambda*cos(t);

figure('Name','Order of Accuracy Test','NumberTitle','off');
for i = 0:7
    h(i+1) = 2^-i;
    
    tic;
    [tArray21, solArray21] = odeSolveTheta(f, tRange, u0, df, 0, h(i+1));
    timer_Theta_FE(i+1) = toc;
    
    tic;
    [tArray22, solArray22] = odeSolveTheta(f, tRange, u0, df, 1/2, h(i+1));
    timer_Theta_CN(i+1) = toc;
    
    tic;
    [tArray23, solArray23] = odeSolveTheta(f, tRange, u0, df, 1, h(i+1));
    timer_Theta_BE(i+1) = toc;
    
    
    error_Theta_FE(i+1) = abs(y(T) - solArray21(end));
    error_Theta_CN(i+1) = abs(y(T) - solArray22(end));
    error_Theta_BE(i+1) = abs(y(T) - solArray23(end));
end
hLambda = h*lambda
h

error_Theta_FE
error_Theta_CN
error_Theta_BE

timer_Theta_FE
timer_Theta_CN
timer_Theta_BE

loglog(h, error_Theta_FE, 'o-', 'DisplayName', '\theta = 0'); hold on
loglog(h, error_Theta_CN, 'o-', 'DisplayName', '\theta = 1/2');
loglog(h, error_Theta_BE, 'o-', 'DisplayName', '\theta = 1');
hold off;
xlabel('step h');
ylabel('Error Value');
title('\theta Method Stability Test (T=10)');
legend('Location', 'best');
set(gca, 'XDir','reverse')








%%           RE: Part 1, plotting separate figures by Theta  
t0 = 0;
T = 10;
tRange = [t0 T];
lambda = -100;
y = @(t) exp(lambda*t) + sin(t);
f = @(t,u) lambda*(u - sin(t)) + cos(t);
u0 = y(0);
df = @(t) -sin(t) - lambda*cos(t);

% Theta = 0
figure('Name','Theta = 0','NumberTitle','off');
for i=1:7   
    h = 2*10^-2 + (i-4)*10^-4;
    [tArray11, solArray11] = odeSolveTheta(f, tRange, u0, df, 0, h);
   
    x = t0:h:T;
    p(i) = plot(x, solArray11, 'DisplayName', ['h=',num2str(h)]); hold on
end
hold off;
xlabel('interval');
ylabel('Solution Arrays');
title('\theta = 0');
legend(p, 'Location', 'best');

% Theta = 1/2
figure('Name','Theta = 1/2','NumberTitle','off');
for i=1:7   
    h = 2*10^-2 + (i-4)*10^-4;
    [tArray12, solArray12] = odeSolveTheta(f, tRange, u0, df, 1/2, h);
   
    x = t0:h:T;
    p(i) = plot(x, solArray12, 'DisplayName', ['h=',num2str(h)]); hold on
end
hold off;
xlabel('interval');
ylabel('Solution Arrays');
title('\theta = 1/2');
legend(p, 'Location', 'best');

% Theta = 1
figure('Name','Theta = 1','NumberTitle','off');
for i=1:7   
    h = 2*10^-2 + (i-4)*10^-4;
    [tArray13, solArray13] = odeSolveTheta(f, tRange, u0, df, 1, h);
   
    x = t0:h:T;
    p(i) = plot(x, solArray13, 'DisplayName', ['h=',num2str(h)]); hold on
end
hold off;
xlabel('interval');
ylabel('Solution Arrays');
title('\theta = 1');
legend(p, 'Location', 'best');


%%           RE: Part 1, plotting separate figures by h  
t0 = 0;
T = 10;
tRange = [t0 T];
lambda = -100;
y = @(t) exp(lambda*t) + sin(t);
f = @(t,u) lambda*(u - sin(t)) + cos(t);
u0 = y(0);
df = @(t) -sin(t) - lambda*cos(t);

for i=1:7
    h = 2*10^-2 + (i-4)*10^-4;
    [tArray11, solArray11] = odeSolveTheta(f, tRange, u0, df, 0, h);
    [tArray12, solArray12] = odeSolveTheta(f, tRange, u0, df, 1/2, h);
    [tArray13, solArray13] = odeSolveTheta(f, tRange, u0, df, 1, h);
   
    figure('Name', ['h = ', num2str(h)], 'NumberTitle', 'off');
    x = t0:h:T;
    plot(x, solArray11, 'DisplayName', '\theta = 0'); hold on
    plot(x, solArray12, 'DisplayName', '\theta = 1/2');
    plot(x, solArray13, 'DisplayName', '\theta = 1');
    hold off;
    xlabel('interval');
    ylabel('Solution Arrays');
    title(['h = ', num2str(h)]);
    legend('Location', 'best');
end


