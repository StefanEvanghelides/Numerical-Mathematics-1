% Exercise 8.2

x = 1:10;
f = arrayfun(@fib,x);
array2table([x',f'], 'variableNames', {'x', 'Fibx'})
