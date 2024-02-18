% Paramètres pour l'estimation
alpha = 3;
theta = 2;
mu = -13;
b = 2;
N = 2336*2; % Nombre total de simulations, choisi pour l'exemple

% Appel de la fonction monte_carlo_antithetic
[p_estimate, variance] = monte_carlo_antithetic(alpha, theta, mu, b, N);

% Calcul de l'intervalle de confiance
alpha_conf = 0.05; % Niveau de confiance (95% de confiance si alpha_conf = 0.05)
z = norminv(1 - alpha_conf/2); % Valeur critique de la distribution normale
margin_error = z * sqrt(variance / N); % Demi-largeur de l'intervalle de confiance
CI = [p_estimate - margin_error, p_estimate + margin_error]; % Intervalle de confiance

% Affichage des résultats
fprintf('Estimation de Monte-Carlo de P(X + Y > 0) : %f\n', p_estimate);
fprintf('Estimation de la variance : %f\n', variance);
fprintf('Nombre de simulations : %d\n', N);
fprintf('Intervalle de confiance à %f%% : [%f, %f]\n', (1-alpha_conf)*100, CI(1), CI(2));
