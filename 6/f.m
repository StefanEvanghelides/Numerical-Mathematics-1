function value = f(func, t, y)
    y_val = y(t);
    value = func(t,y_val);
    
end