function [int, flag, stats] = simpComp(f, a, b, tol, hMin)
    % Initialise variables
    h = b - a;
    n = 1;
    x_mean = (a+b)/2;
    int = h / 6 * (f(a) + f(b)) + h / 3 * x_mean;
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
        intNew = int / 2;
        for j = 1 : 2 : n
            mean_interval = (j * (j + 1))/2;
            intNew = intNew + h / 3 * (f(a + j * h) + 2 * f(a + mean_interval * h));
        end

        % Estimate the error
        errorEst = 1 / 3 * (int - intNew);
        int = intNew;
        if nargout == 3 % Update stats
            stats.totalErEst = [stats.totalErEst; abs(errorEst)];
            stats.totalNrIntervals = [stats.totalNrIntervals; n / 2];
        end

        if abs(errorEst) < tol
            flag = 0;
            break
        end
    end
   
end