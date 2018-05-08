% INPUT
% x         nodal points x_i
% r         polynomial degree
function A = makeVandermondeMatrix(x, r)
    x = x(:);
    % initialize A using ones
    A = ones(length(x), r+1);
    for i = 2:r+1
        % The ith column of A is equal to the previous column multiplied
        % element wise by x
       A(:, i) = x .* A(:, i-1); 
    end
end

