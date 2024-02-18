% Paramètres pour l'estimation
alpha = 3;
theta = 2;
mu = -13;
b = 2;
delta = 0.01; % Demi-largeur de l'intervalle de confiance
alpha_conf = 0.05; % Niveau de confiance (95% de confiance si alpha_conf = 0.05)

% Appel de la fonction
[p_estimate, sigma2, N, CI] = estimate_p_variance_confidence(alpha, theta, mu, b, delta, alpha_conf);

% Affichage des résultats
fprintf('Estimation de Monte-Carlo de P(X + Y > 0) : %f\n', p_estimate);
fprintf('Estimation de la variance : %f\n', sigma2);
fprintf('Nombre de simulations : %d\n', N);
fprintf('Intervalle de confiance à %f%% : [%f, %f]\n', (1-alpha_conf)*100, CI(1), CI(2));
