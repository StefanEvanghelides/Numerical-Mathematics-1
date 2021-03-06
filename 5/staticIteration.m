% INPUT
% f         function of rootfinding problem
% c         static parameter: xnew = x + c*f(x)
% x0        initial guess
% tol       desired tolerance
% maxIt     maximum number of iterations
% OUTPUT
% root      root of f
% flag      if 0: attained desired tolerance
%           if 1: reached maxIt nr of iterations
% convHist  error estimate per iteration
% rootHist  root approximation per iteration
function [root, flag, convHist, rootHist] = staticIteration(f, c, x0, tol, maxIt)
    flag = 1; % We did not attain the desired tolerance
    rootHist(1) = x0;
    
    for k = 2:maxIt
        x = rootHist(k-1);
        xnew = x + c*f(x);
        rootHist(k) = xnew;
        convHist(k) = abs(rootHist(k) - rootHist(k-1));
        root = rootHist(k);
        if convHist(k) < tol
            flag = 0;
            break;
        end
        
    end

end