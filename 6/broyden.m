% INPUT
% f         function of rootfinding problem
% x0        is the initial guess
% tol       is the desired tolerance
% maxIt     maximum number of iterations
% OUTPUT
% root      if succesful, root is an approximation to the
%           root of the nonlinear equation
% flag      flag = 0: tolerance attained, flag = 1: reached maxIt
% convHist  convergence history
function [root, flag, convHist] = broyden(f, x0, tol, maxIt)

    if (nargin < 2), error('broyden:input',...
        'Not enough input: at least f and x0 should be given.');
    end
    if (nargin < 3), tol = 1E-8; end
    if (nargin < 4), maxIt = 15; end

    % Initialisation
    root = x0;
    convHist = zeros(maxIt, 1);
    errEst = Inf;
    iter = 0;
    flag = 0;

    broydenSize = 0;
    maxBroydenSize = Inf;

    % The Jacobian is approximated using rank-1 updates (J_0 = I)
    %   J_k+1 = J_k + u * v',
    %   Jinv_k+1 = (I + w * v') * Jinv_k,
    % where
    %   w = -(Jinv_k * u) * v' / (1 + v' * (Jinv_k * u))
    broydenV = zeros(numel(x0), maxIt);
    broydenW = zeros(numel(x0), maxIt);

    residual = f(root);
    while errEst > tol

        % Update solution
        update = solveBroyden(-residual);
        root = root + update;

        % Update the Jacobian approximation
        residual = f(root);
        if maxBroydenSize > 0
            extendBroyden(update, residual);
        end

        % Convergence check
        iter = iter + 1;
        % errEst = norm(update);
        errEst = norm(residual);
        convHist(iter) = errEst;
        if iter == maxIt
            flag = 1;
            break;
        end

        if broydenSize == maxBroydenSize
            broydenSize = 0;
        end

    end

    % Clean up
    convHist(iter + 1 : end) = [];

    % Extends U, V and W
    function extendBroyden(update, residual)
        v = update / norm(update);
        u = residual / norm(update);

        invJResUpdate = solveBroyden(u);
        w = -invJResUpdate / (1 + v' * invJResUpdate);

        broydenV(:, broydenSize + 1) = v;
        broydenW(:, broydenSize + 1) = w;
        broydenSize = broydenSize + 1;
    end

    % Solve J * x = b for x
    function x = solveBroyden(b)
        x = b;
        for idx = 1 : broydenSize
            x = x + broydenW(:, idx) * (broydenV(:, idx)' * x);
        end
    end
end
