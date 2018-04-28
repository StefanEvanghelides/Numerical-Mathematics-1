% INPUT
% f         function handle
% df        function handle of the derivative of f
% x         point at which to evaluate f and df
% iMax      maximum number of refinements
% h0        initial h
% OUTPUT
% errList   array containing the errors in approximating df
% hList     array containing values of h
function [errList_left, errList_right, hList] = diffConsistency(f, df, x, iMax, h0)
  hList = zeros(1, iMax, 'double');
  hList(1) = h0;
  for i = [2,iMax]
    hList(i) = hList(i-1) / 10;
    if hList(i) < eps % Check if h is not "zero"
        hList(i) = hList(i-1);
    end
    df_approx_left = (f(x+hList(i)) - f(x))/hList(i);
    df_approx_right = 0;
    errList_left(i) = abs(df_approx_left - df(x));
    errList_right(i) = abs(df_approx_right - df(x));
  end

end 
