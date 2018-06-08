% Solves the 1D heat eqn
%       du/dt = mu laplace u + p(x,t) on (0,1) x (0, tEnd)
% and initial condition u0 (the Dirichlet boundary
% conditions are imposed by u0)
% INPUT
% p         right-hand side forcing term (function of x and t)
% u0Func    initial condition function (function of x)
% mu        diffusion coefficient
% theta     parameter for time integration
% tEnd      end time
% N         number of unknowns (h = 1 / (N + 1))
% dt        step-size
% OUTPUT
% tArray    array containing the time points
% solArray  array containing the solution at each time level
%           (the ith row equals the solution at time tArray(i))
%           (nrTimeSteps + 1) x (N+2) array
% nodes     (N+2) x 1 array with location of spatial nodes
function [tArray, solArray, nodes] = heatSolveTheta(p,...
    u0Func , mu, theta, tEnd, N, dt)

    h = 1/(N+1);
    nodes = 0:h:1;
    u0 = u0Func(0);
    tRange = [0 tEnd];
    
    for i = 1:N
        x = nodes(i);
        p(x);
        [solArray,tArray] = odeSolveTheta(p, tRange, u0, df, theta, dt); 
    end

% Performs integration of the system of ODEs given by
%           d/dt u = f(t, u(t)), u(tRange(1)) = u0
% using the theta-method
% INPUT
% f         the right-hand side function, the output should be a
%           N x 1 array where N is the number of unknowns
% tRange    the time interval of integration
% u0        initial solution at t = tRange(1) (N x 1 array)
% df        a function that evaluates the jacobian of f
% theta     defines the method
% h         the step-size
% OUTPUT
% tArray    array containing the time points
% solArray  array containing the solution at each time level
%           (the ith row equals the solution at time tArray(i))
%[tArray, solArray] = odeSolveTheta(f, tRange, u0, df, theta, h)

end 
