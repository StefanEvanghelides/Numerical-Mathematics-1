function est_pi = approx_pi_Recursive(N)

    est_pi = 2 * approx_pi_Recursive_Helper(N, 1);

end