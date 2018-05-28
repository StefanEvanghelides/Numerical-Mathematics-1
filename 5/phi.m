function x_res = phi(x, phi0, depth)
    if depth == 1
        x_res = x - (x - phi0(x))^2 ./ (phi0(phi0(x)) - 2*phi0(x) + x);
        return
    elseif depth == 0
        x_res = phi0(x);
        return
    end
    x_res = x - (x - phi(x,phi0,depth-1))^2 ./ (phi(phi(x,phi0,depth-1),phi0,depth-1) - 2*phi(x,phi0,depth-1) + x);
end 
