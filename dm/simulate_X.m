function x = simulate_X(alpha, theta)
    % Cette fonction simule une variable aléatoire
    % suivant une distribution gamma avec des paramètres alpha et theta
    % en utilisant la somme de variables aléatoires exponentielles.
    
    lambda = 1 / theta; % Taux pour la distribution exponentielle
    x = sum(exprnd(1/lambda, [alpha, 1]));
end
