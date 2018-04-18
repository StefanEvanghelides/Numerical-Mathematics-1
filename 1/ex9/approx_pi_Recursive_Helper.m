function est_pi = approx_pi_Recursive_Helper(N,i)

    if N <= i
        est_pi = 0;
        return
    end

    est_pi = 1 + (i./(2*i + 1)) * approx_pi_Recursive_Helper(N, i+1);

end