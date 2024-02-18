function [p_estimate, variance] = monte_carlo_p_antithetic(alpha, theta, mu, b, N)
    % alpha, theta : paramètres de la distribution gamma pour X
    % mu, b : paramètres de la distribution mixte pour Y
    % N : nombre total de simulations (doit être pair)

    % Assurer que N est pair
    N = ceil(N/2) * 2;

    % Initialiser les compteurs
    count = 0;
    sum_var = 0;
    
    for i = 1:N/2
        % Simuler les variables
        x = simulate_X(alpha, theta);
        y = simulate_Y(mu, b);
        
        % Compter si la somme est supérieure à 0
        if (x + y > 0)
            count = count + 1;
        end

        % Point antithétique
        x_ant = Fx_generate_Antithetic(x, alpha, theta);
        y_ant = Fy_generate_Antithetic(y, mu, b); % Réflexion de y par rapport à mu
        
        
        if (x_ant + y_ant > 0) 
            count = count + 1;
        end
        
        % Calculer la différence pour la variance
        sum_var = sum_var + ((x + y > 0) - (x + y_ant > 0))^2;
    end

    % Calcul de l'estimation de p
    p_estimate = count / N;

    % Calcul de la variance
    variance = sum_var / (N/2);
end


