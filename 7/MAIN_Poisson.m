g = [0 0];
f = @(x) pi^2 * sin(pi*x);
u_tilde = @(x) sin(pi*x);
precon = 'none';
tol = 10^-12;

iter_start = 2;
iter_end = 13;
h = zeros(iter_end - iter_start + 1, 1);
max_error = zeros(iter_end - iter_start + 1, 1);

for i = iter_start : iter_end
    h(i-1) = 2^-i;
    N = 1/h(i-1) - 1;

    [sol, nodes] = poissonSolveFD(f, g, N, precon, tol);
    
    error = abs(u_tilde(nodes) - sol);    
    max_error(i-1) = max(error);
   
%    if i==10
%        h(i:end) = [];
%        max_error(i:end) = [];
%        break
%    end
   
end


figure('Name','Maximum Error over h','NumberTitle','off');
loglog(h, max_error, 'bo-', 'DisplayName', '\epsilon(h)'); hold on
loglog(h, h.^2, 'r--', 'DisplayName', 'y = h^2');
hold off;
xlabel('h');
ylabel('\epsilon(h)');
title('Maximum Error over h');
legend('Location', 'best');
set(gca, 'XDir','reverse')
