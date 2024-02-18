function [p_estimate, sigma2, N, CI] = estimate_p_variance_confidence(alpha, theta, mu, b, delta, alpha_conf)
    % alpha, theta : paramètres de la distribution gamma pour X
    % mu, b : paramètres de la distribution mixte pour Y
    % delta : demi-largeur de l'intervalle de confiance souhaité
    % alpha_conf : niveau de confiance souhaité (e.g., 0.05 pour 95% de confiance)
    
    c = norminv(1 - alpha_conf/2);
    S2 = 0;
    p_bar = 0;
    n = 1;
    while ((2 * n) < (c^2 * S2 / delta^2) || S2 == 0)
        x_sample = simulate_gamma_x(alpha, theta);
        y_sample = simulate_mixed_y(mu, b);
        x_sample_prime = simulate_gamma_x(alpha, theta);
        y_sample_prime = simulate_mixed_y(mu, b);
        
        Y = (x_sample + y_sample > 0);
        Y_prime = (x_sample_prime + y_sample_prime > 0);
        
        p_bar = p_bar + Y + Y_prime;
        S2 = (2 * n * S2 + (Y - Y_prime)^2) / (2 * (n + 1));
        n = n + 1;
    end
    N = 2 * n;
    p_estimate = p_bar / N;
    sigma2 = S2;
    
    % Calcul de l'intervalle de confiance
    CI = [p_estimate - c * sqrt(S2/N), p_estimate + c * sqrt(S2/N)];
end
