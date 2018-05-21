% Solves A * x = b, with initial guess x0 using
% several iterative methods of the form
%           x^{k+1} = x^{k} + alpha_k P \ r^{k}, r^{k} = b - A x^{k}
% where alpha_k as well as P is varied
% INPUT
% A             nxn matrix or a function handle
% b             nx1 right-hand side
% x0            initial guess
% tol           desired tolerance
% maxIt         maximum number of iterations
% OUTPUT
% experiments   structure containing the results
function experiments = iterCompare(A, b, x0, tol, maxIt)

    % The following alphas are considered:
    alphaTypes = {'Static', 'Dynamic1', 'Dynamic2'};
    % The following preconditioners:
    precTypes = {'None', 'Jacobi', 'Gauss-Seidel'};
    experiments = struct('aType', [], 'pType', [], 'alpha0', [], 'precon', [],...
        'x', [], 'flag', [], 'conv', []);

    iterResults = cell2struct({[], [], []}, alphaTypes, 2);

    % Perform experiments
    idx = 1;
    for adx = 1:numel(alphaTypes)
        for pdx = 1:numel(precTypes)
            experiments(adx, pdx).aType = alphaTypes{adx};
            experiments(adx, pdx).pType = precTypes{pdx};
            experiments(adx, pdx) = performExperiment(experiments(adx, pdx));

            iterResults.(alphaTypes{adx}) = [iterResults.(alphaTypes{adx}); length(experiments(adx, pdx).conv)];
        end
    end

    % Display nr of iterations
    disp(struct2table(iterResults, 'RowNames', precTypes));

    plotExp = [1 1; 1 2; 2 3; 3 3]; % Static & No prec, Static & Jacobi, Dynamic1 & GS, Dynamic2 & GS
    markers = {'o-', '+-', '-', '-'};
    plotConvergence(experiments(sub2ind(size(experiments), plotExp(:, 1), plotExp(:, 2))), markers);

    function experiment = performExperiment(experiment)
        experiment.precon = makePrecon(A, experiment.pType);

        switch experiment.aType
        case 'Static'
            experiment.alpha0 = optimalAlpha(A, experiment.precon, experiment.pType);
            dynamic = 0;
        otherwise
            dynamic = str2num(experiment.aType(end));
        end
        [experiment.x, experiment.flag, experiment.conv] = iterMethod(A, b, x0,...
            tol, maxIt, experiment.precon, dynamic, experiment.alpha0);
    end
end

function P = makePrecon(A, pType)
    switch pType
    case 'None'
        P = [];
    case 'Jacobi'
        P = spdiags(diag(A), 0, size(A, 1), size(A, 2));
    case 'Gauss-Seidel'
        P = tril(A, 0);
    end
end

function alpha0 = optimalAlpha(A, P, pType)
    if strcmp(pType, 'Gauss-Seidel')
        alpha0 = 3 / 2;
    else
        if ~isempty(P)
            eigVal = eig(full(A), full(P));
        else
            eigVal = eig(full(A));
        end
        [~, sorted] = sort(abs(eigVal));
        eigVal = eigVal(sorted);
        % Optimal (for SPD A) static alpha
        alpha0 = 2 / (eigVal(1) + eigVal(end));
    end
end

function plotConvergence(experiments, plottingStyle)
    figure('Name','Convergence','NumberTitle','off');
    myCmap = lines(numel(experiments));
    hold on
    myLegend = {};
    for edx = 1:numel(experiments)
        experiment = experiments(edx);
        plot(experiment.conv, plottingStyle{edx}, 'Color', myCmap(edx, :), 'MarkerSize', 4);
        myLegend{end + 1} = sprintf('$\\mathbf{P}$ = %s \\& $\\alpha = $ %s', experiment.pType, experiment.aType);
    end
    hold off
    set(gca, 'YScale', 'log')
    ltx = {'Interpreter', 'LaTeX'};
    xlabel('Iteration $k$', ltx{:});
    ylabel('$\|r^{(k)}\|/\|b\|$', ltx{:});
    legend(myLegend, 'Location', 'NorthEast', ltx{:});
end
