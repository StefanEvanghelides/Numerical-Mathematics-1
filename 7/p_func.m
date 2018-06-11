function res = p(P_star, x)
    if x > 0.4 && x < 0.6
        res = P_star;
    elseif x == 0.4 || x == 0.6
        res = P_star / 2;
    else
        res = 0;
    end
end

