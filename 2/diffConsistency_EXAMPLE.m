% INPUT
% f         function handle
% df        function handle of the derivative of f
% x         point at which to evaluate f and df
% iMax      maximum number of refinements
% h0        initial h
% OUTPUT
% errList   array containing the errors in approximating df
% hList     array containing values of h
function [errList, hList] = diffConsistency(f, df, x, iMax, h0)
