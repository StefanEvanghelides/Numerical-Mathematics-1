% INPUT
% NVals       an array defining which values of N should be tested
% varargin    variable length input argument list containing function
%             handles to the algorithms that should be tested
function error = approx_pi_compare(NVals, varargin)

    digits(20); % set the precision to 20 digits when a floating point number is called using vpa()
    
    for i = 1:size(varargin')
        for j = 1:size(NVals')
            pi_approx(i,j) = varargin{i}(NVals(j));
            error(i,j) = vpa(pi) - vpa(pi_approx(i,j)); % vpa will have a higher precision, defined using digits()
        end
    end
    
end