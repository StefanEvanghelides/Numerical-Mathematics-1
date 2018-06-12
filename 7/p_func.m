function res = p_func(x,t)
    P_star = 2 * 10^7 / (450 * 7874);
    if x > 0.4 && x < 0.6
        res = P_star;
    elseif x == 0.4 || x == 0.6
        res = P_star / 2;
    else
        res = 0;
    end
end

