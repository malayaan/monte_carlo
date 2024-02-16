function p_estimate = monte_carlo_estimator(alpha, theta, mu, b, N)
    % alpha, theta : paramètres de la distribution gamma pour X
    % mu, b : paramètres de la distribution mixte pour Y
    % N : nombre de simulations à générer
    
    % Initialiser le compteur pour les cas où X + Y > 0
    count = 0;
    
    % Boucle pour générer les échantillons et effectuer les tests
    for i = 1:N
        x_sample = simulate_gamma_x(alpha, theta);
        y_sample = simulate_mixed_y(mu, b);
        
        % Incrémenter le compteur si la somme est supérieure à 0
        if (x_sample + y_sample > 0)
            count = count + 1;
        end
    end
    
    % L'estimateur de Monte-Carlo est la proportion de sommes positives
    p_estimate = count / N;
end
function [outputArg1,outputArg2] = untitled2(inputArg1,inputArg2)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
outputArg1 = inputArg1;
outputArg2 = inputArg2;
end