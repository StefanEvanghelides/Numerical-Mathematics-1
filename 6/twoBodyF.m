% INPUT
% t         current time (not used)
% solVec    current solution (should be 6x1 array)
% OUTPUT 
% dSolVec   right-hand side
function dSolVec = twoBodyF(t, solVec)
    syms u(t) x(t)
    
    ode1 = diff(u) == - (4 * pi^2)/(norm(x,2)^3) * x;
    ode2 = diff(x) == u;
    odes = [ode1; ode2];
    
    dSolVec = dsolve(odes);
    
end