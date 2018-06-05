% INPUT
% t         current time (not used)
% solVec    current solution (should be 6x1 array)
% OUTPUT 
% J         Jacobian matrix
function J = twoBodyJac(t, solVec)
    % Renaming for consistency with equation
    x = solVec(4:6);
    % Left submatrix of Jacobian
    Jl = vertcat(zeros(3),eye(3));
    B = - (4*pi^2)/(norm(x,2)^3)*eye(3) + (12*pi^2)/(norm(x,2)^5)*(x*x');
    % Right submatrix of Jacobian, containing B
    Jr = vertcat(B,zeros(3));
    % Construct the Jacobian from subparts
    J = horzcat(Jl,Jr);
end