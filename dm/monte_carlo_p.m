function [p_estimate, sigma2, CI] = monte_carlo_p(alpha, theta, mu, b, alpha_conf,N)
    % alpha, theta : paramètres de la distribution gamma pour X
    % mu, b : paramètres de la distribution mixte pour Y
    % delta : demi-largeur de l'intervalle de confiance souhaité
    % alpha_conf : niveau de confiance souhaité (e.g., 0.05 pour 95% de confiance)
    c = norminv(1 - alpha_conf/2);
    S2 = 0;
    p_bar = 0;
    % Assurer que N est pair
    N = ceil(N/2) * 2;
    for i = 1:N/2
        x_sample = simulate_X(alpha, theta);
        y_sample = simulate_Y(mu, b);
        x_sample_prime = simulate_X(alpha, theta);
        y_sample_prime = simulate_Y(mu, b);
        
        Y = (x_sample + y_sample > 0);
        Y_prime = (x_sample_prime + y_sample_prime > 0);
        
        p_bar = p_bar + Y + Y_prime;
        S2 = (2 * i * S2 + (Y - Y_prime)^2) / (2 * (i + 1));
    end
    p_estimate = p_bar / N;
    sigma2 = S2;
    
    % Calcul de l'intervalle de confiance
    CI = [p_estimate - c * sqrt(S2/N), p_estimate + c * sqrt(S2/N)];
end
