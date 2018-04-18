function y = Collatz(n)
    if mod(n,2) == 0
        y = n/2;
    else 
        y = 3*n + 1;
    end

end

