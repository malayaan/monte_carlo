function [p_estimate, variance_estimee, CI] = monte_carlo_p_antithetic(alpha, theta, mu, b, alpha_conf,N)
    % Initialisation
    c = norminv(1 - alpha_conf/2);
    compteur = 0;
    sum_var = 0;
    % Assurer que N est pair
    N = ceil(N/2) * 2;
    for i = 1:N/2
        [x, y] = simulate_pair(mu, b, alpha, theta);
        x_ant = Fx_generate_Antithetic(x, alpha, theta);
        y_ant = Fy_generate_Antithetic(y, mu, b);

        [x_suiv, y_suiv] = simulate_pair(mu, b, alpha, theta);
        x_ant_suiv = Fx_generate_Antithetic(x_suiv, alpha, theta);
        y_ant_suiv = Fy_generate_Antithetic(y_suiv, mu, b);

        Y = ((x_ant + y_ant > 0) + (x + y > 0))/2;
        Y_suiv = ((x_ant_suiv + y_ant_suiv > 0) + (x_suiv + y_suiv > 0))/2;
        compteur = compteur + Y + Y_suiv;

        % Utiliser la formule de mise à jour séquentielle pour la variance
        sum_var = sum_var + (Y - Y_suiv)^2;
        
    end
    % Calcul de l'estimation
    p_estimate = compteur / N;
    
    % calcul de sigma^2
    variance_estimee = sum_var / N;

    % Calcul de l'intervalle de confiance
    CI = [p_estimate - c * sqrt(variance_estimee/N), p_estimate + c * sqrt(variance_estimee/N)];
end
