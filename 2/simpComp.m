function [int, flag, stats] = simpComp(f, a, b, tol, hMin)
    % Initialise variables
    h = b - a;
    n = 1;
    int = (h / 3) * (f(a) + f(b));
    flag = 1;

    if nargout == 3
        stats = struct('totalErEst', [], 'totalNrIntervals', [], 'nodesList', []);
    end

    while h > hMin
        h = h / 2;
        n = 2 * n;
        if h < eps % Check if h is not "zero"
            break;
        end

        % Update the integral with the new nodes
        intNew = int; 
        for j = 1 : 2 : n
            intNew = intNew + ((2 * h) / 3) * f(a + (j+1) * h) + ...
                ((4 * h) / 3) * f(a + j*h) ;
        end

        % Estimate the error
        int = intNew / 2;
        errorEst = 1 / 3 * (int - intNew);
        if nargout == 3 % Update stats
            stats.totalErEst = [stats.totalErEst; abs(errorEst)];
            stats.totalNrIntervals = [stats.totalNrIntervals; n / 2];
        end

        if abs(errorEst) < tol
            flag = 0;
            break
        end
    end