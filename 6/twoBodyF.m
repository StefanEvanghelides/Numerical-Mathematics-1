% INPUT
% t         current time (not used)
% solVec    current solution (should be 6x1 array)
% OUTPUT 
% dSolVec   right-hand side
function dSolVec = twoBodyF(t, solVec) 
    x = solVec(1:3);
    u = solVec(4:6);
    
    f1 = - (4*pi^2)/(norm(x,2)^3) * x;
    f2 = u;
    
    dSolVec = [ f1 f2 ];
end