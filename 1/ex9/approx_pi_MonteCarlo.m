function est_pi = approx_pi_MonteCarlo(N)
    count = 0;
    for i = 1:N
        dartX = 2*rand - 1;
        dartY = 2*rand - 1;
        if sqrt(dartX.^2 + dartY.^2) <= 1
            count = count + 1;
        end
    end
    est_pi = (count./N) * 4;
end