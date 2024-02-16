function y = simulate_mixed_y(mu, b)
    % Cette fonction simule une variable aléatoire suivant la distribution mixte donnée pour Y.

    U = rand(); % Génère une variable uniforme sur [0,1]

    % La probabilité de la partie affine de la densité de Y doit être calculée
    % en fonction de l'intégrale de la densité sur l'intervalle [mu-2b, mu].
    % Ici, nous avons déjà calculé l'aire sous la courbe de la partie affine comme 1/2.
    prob_affine = 1/2;

    if U < prob_affine
        % Génère une variable aléatoire pour la partie affine
        y = simulate_affine_density(1/(2*b^2), -17, -13);
    else
        % Génère une variable aléatoire exponentielle tronquée pour y > μ
        y = simulate_exponential(mu, b);
    end
end