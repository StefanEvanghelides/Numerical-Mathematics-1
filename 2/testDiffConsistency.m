f = @(x) (sin(x) + exp(x));
df = @(x) (cos(x) + exp(x));
iMax = 20;
h0 = 1;
x = 0.2;

diffConsistency(f,df,x,iMax,h0)

