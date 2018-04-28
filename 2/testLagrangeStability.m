% Author: FrankTN and StefanE
% Created: 2018-04-28
% Description: This function returns, for multiple node numbers, the error 
%              values between the nodes. 

function [e_equid, e_chebyshev] = testLagrangeStability
  count = 1;
  for n = [8,16,32]
    % return a vector of interpolation nodes
    for i = 1:n
      % First we create equidistant nodes
      x_equid(i) = -pi/2 + ((i-1)*pi)/n;
      % Then nodes according to the Chebyshev Gauss Lobatto interpolation
      x_chebyshev(i) = -pi/2 * cos(pi*i/n);
    end
    e_equid(count) = lagrangeStability(@cos, x_equid, 10^(-2))
    e_chebyshev(count) = lagrangeStability(@cos, x_chebyshev, 10^(-2))
  end
  count = count + 1;
end
