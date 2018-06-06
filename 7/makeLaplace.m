% INPUT
% N         number of unknowns (h = 1 / (N + 1))
% OUTPUT
% L         discrete Laplace operator (3-point stencil)
function L = makeLaplace(N)
    L = full(gallery('tridiag',N,-1,2,-1));
end
