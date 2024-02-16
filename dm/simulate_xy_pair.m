function [x, y] = simulate_xy_pair(mu, b, alpha, theta)
    % Simule un couple de variables (X, Y) indépendantes avec les mêmes lois
    % que X et Y respectivement.
    x = simulate_gamma_x(alpha, theta);
    y = simulate_mixed_y(mu, b);
end
