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
function [tArray, solArray] = odeSolveTheta(f, tRange, u0, df, theta, h)
    % Metadata
    tol = 10^-9;
    maxIt = 50;
    N = 1;

    % Initialize and perform first step
    t0 = tRange(1);
    T = tRange(2);
    idx = 1;
    tArray(idx) = t0;
    solArray(:,idx) = u0;
    
    for t = (t0+h):h:T        
        u = solArray(:,idx);
        idx = idx + 1;
        tArray(idx) = t; 

        F = @(uF) uF - u - h*(theta*f((t+h),uF) + (1-theta)*f(t,u)); 
        
        if isempty(df)
            [root, ~, ~] = broyden(F, u, tol, maxIt);
        else
            J = @(t) eye(N) - theta*h*df(t);
            J(zeros(6,1))
            [root, ~, ~] = newton(F,J, u, tol, maxIt);
        end
        
        solArray(:,idx) = root;     
    end
end
