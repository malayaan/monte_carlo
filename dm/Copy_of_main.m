% Définir les paramètres
alpha = 3;
theta = 2;
mu = -13;
b = 2;

% Nombre de simulations
N = 10000;

% Appel de la fonction pour estimer p
p_estimate = monte_carlo_estimator(alpha, theta, mu, b, N);

% Afficher l'estimation de p
disp(['Estimation de Monte-Carlo de P(X + Y > 0) : ', num2str(p_estimate)]);
