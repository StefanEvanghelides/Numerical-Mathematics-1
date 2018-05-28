% INPUT
% f         function of rootfinding problem
% df        function returning Jacobian matrix
% x0        is the initial guess
% tol       is the desired tolerance
% maxIt     maximum number of iterations
% OUTPUT
% root      if succesful, root is an approximation to the
%           root of the nonlinear equation
% flag      flag = 0: tolerance attained, flag = 1: reached maxIt
% convHist  convergence history
function [root, flag, convHist] = newton(f, df, x0, tol, maxIt)

    if (nargin < 3), error('newton:input',...
        'Not enough input: at least f, df and x0 should be given.');
    end
    if (nargin < 4), tol = 1E-9; end
    if (nargin < 5), maxIt = 50; end

    % Initialisation
    root = x0;
    convHist = zeros(maxIt, 1);
    iter = 0;
    flag = 0;
    errEst = Inf;
    while errEst > tol
        % Calculate update
        residual = f(root);
        update = -df(root) \ residual;

        % Update solution
        root = root + update;

        % Convergence check
        iter = iter + 1;
        % errEst = norm(update);
        errEst = norm(residual);
        convHist(iter) = errEst;
        if iter == maxIt
            flag = 1;
            break;
        end
    end

    % Clean up
    convHist(iter + 1 : end) = [];
end
