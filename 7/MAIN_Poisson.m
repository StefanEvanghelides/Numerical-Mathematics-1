g = [0 0];
f = @(x) pi^2 * sin(pi*x);
precon = 'none';
tol = 10^-12;

for i = 2:13
   h = 2^-i;
   N = 1/h - 1;
   
   [sol, nodes] = poissonSolveFD(f, g, N, precon, tol);
   sol
   nodes
   
   break;
   
end