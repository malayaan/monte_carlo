% Paramètres pour l'estimation
alpha = 3;
theta = 2;
mu = -13;
b = 2;
alpha_conf = 0.05; % Niveau de confiance (95% de confiance si alpha_conf = 0.05)

% Initialiser des vecteurs pour stocker les résultats
p_estimate_values = zeros(100, 1);
variance_estimee_values = zeros(100, 1);
CI_values = zeros(100, 2);

% Boucle sur différentes valeurs de N avec un pas de 10 de 1 à 1000
for i = 1:100
    N = i * 10;

    % Appel de la fonction monte_carlo_p_antithetic
    [p_estimate, variance_estimee, CI] = monte_carlo_p_antithetic(alpha, theta, mu, b, alpha_conf, N);

    % Stocker les résultats
    p_estimate_values(i) = p_estimate;
    variance_estimee_values(i) = variance_estimee;
    CI_values(i, :) = CI;
end

% Affichage des résultats pour la dernière valeur de N
fprintf('Estimation de Monte-Carlo de P(X + Y > 0) avec antithétique : %f\n', p_estimate);
fprintf('Estimation de la variance avec antithétique : %f\n', variance_estimee);
fprintf('Intervalle de confiance à %f%% avec antithétique : [%f, %f]\n', (1 - alpha_conf) * 100, CI(1), CI(2));

% Tracer la courbe avec intervalle d'écart type
figure;
plot((1:100) * 10, p_estimate_values, '-o');
hold on;
title('Estimation de P(X + Y > 0) avec antithétique et intervalle d''écart type en fonction de N');
xlabel('N');
ylabel('Estimation');

% Ajouter l'intervalle de confiance en tant que zone ombrée
alpha_patch = fill([(1:100) * 10, fliplr((1:100) * 10)], [CI_values(:, 1)', fliplr(CI_values(:, 2)')], 'blue', 'FaceAlpha', 0.3);
legend([alpha_patch], 'Intervalle de confiance avec antithétique');

% Calculez la moyenne des 10 dernières valeurs de p_estimate_values
mean_last_values = mean(p_estimate_values(end-9:end));

% Tracez une droite horizontale à cette valeur moyenne
yline(mean_last_values, '--', 'Color', 'red', 'LineWidth', 2, 'Label', 'Valeur limite estimée avec antithétique');

% Affichez la valeur limite estimée avec antithétique
fprintf('Valeur limite estimée de p avec antithétique : %f\n', mean_last_values);

hold off;
