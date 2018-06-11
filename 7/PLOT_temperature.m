function PLOT_temperature(solArray, theta, dt, N)
    figure('Name', 'Temperature plot', 'NumberTitle', 'off');
    colormap('default')
    imagesc(solArray)
    colorbar
    title(['Temperature map(\theta=', num2str(theta), ...
                         ', \Deltat=', num2str(dt), ...
                         ', N=', num2str(N), ')']);
    xlabel('nodes');
    ylabel('\Deltat');
end

