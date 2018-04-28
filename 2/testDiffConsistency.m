f = @(x) (sin(x) + exp(x));
df = @(x) (cos(x) + exp(x));
iMax = 20;
h0 = 1;

rng(10);
x = rand;

digits(4);
disp('eps:'); disp(eps);

[errList_left, errList_right, hList] = diffConsistency(f,df,x,iMax,h0);
disp('hList:'); disp(vpa(hList));
disp('errList:'); disp(vpa(errList_left));

x_axis = logspace(-1, -20);
loglog(x_axis, f);