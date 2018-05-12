f = @(x) (sin(x) + exp(x));
df = @(x) (cos(x) + exp(x));
iMax = 20;
h0 = 1;

rng(10);
x = rand;

digits(4);

[errList, hList] = diffConsistency(f,df,x,iMax,h0);
disp('hList:'); disp(vpa(hList));
disp('errList:'); disp(vpa(errList));

log_h = logspace(0, -20, iMax);
loglog(log_h, errList);
title('Log of Absolute Error versus log of h');
xlabel('h value');
ylabel('error based on h');
legend('error');