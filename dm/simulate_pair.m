function [x, y] = simulate_pair(mu, b, alpha, theta)
    % Simule un couple de variables (X, Y) indépendantes avec les mêmes lois
    % que X et Y respectivement.
    x = simulate_X(alpha, theta);
    y = simulate_Y(mu, b);
end
