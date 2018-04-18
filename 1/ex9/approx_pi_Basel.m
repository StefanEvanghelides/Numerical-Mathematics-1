function est_pi = approx_pi_Basel(N)

    f = @(x) 1./(x.^2);
    
    sum = 0;
    for i = 1:N
       sum = sum + f(i); 
    end

    est_pi = sqrt(6 * sum);
end