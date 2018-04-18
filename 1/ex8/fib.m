function y = fib(x)
   if x <= 1
       y = x;
       return
   end
   y = fib(x-1) + fib(x-2);
end