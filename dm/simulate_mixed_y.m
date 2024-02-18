function y = simulate_mixed_y(mu, b)
    % Cette fonction simule une variable aléatoire suivant la distribution mixte donnée pour Y.
    U = rand(); % Génère une variable uniforme sur [0,1]
    % La probabilité de la partie affine de la densité de Y doit être calculée
    y = inverse_integral_f(mu,b,U);
end