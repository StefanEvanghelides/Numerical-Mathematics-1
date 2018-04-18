function est_pi = approx_pi_Buffon(N)
    l = 5;
    delta_x = 7;
    
    count = 0;
    for i = 1:N
        x1 = delta_x * rand;
        y1 = delta_x * rand;
        x2 = delta_x * rand;
        y2 = delta_x * rand;
        
        distance = sqrt((x2-x1).^2 + (y2-y1).^2);
        
        % Unitizing the value for distance l;
        x2 = (x2 - x1) * l / distance;
        y2 = (y2 - y1) * l / distance;
        
        distance = sqrt((x2-x1).^2 + (y2-y1).^2);  % This should be equal to L
        
        % Checking for crosses
        if (x1 <= delta_x && x2 >= delta_x) || (x1 >= delta_x && x2 <= delta_x)...
                || (x1 <= 0 && x2 >= 0) || (x1 >= 0 && x2 <= 0)
            count = count + 1;
        end
    end
    
    P = count / N;
    est_pi = 2 * l / (delta_x * P);
end