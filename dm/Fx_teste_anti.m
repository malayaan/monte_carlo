alpha = 3;
theta = 2;
x = 10*rand() % Générer x aléatoirement

% Générer x_anti en utilisant la fonction définie
x_anti = generateAntitheticX(x, alpha, theta)

% Calculer la médiane de la distribution Gamma
medianGamma = theta * gammaincinv(0.5, alpha);

% Définir une gamme de valeurs pour le tracé de la densité
t = 0:0.1:20;

% Calculer la densité de probabilité pour ces valeurs
pdfValues = gampdf(t, alpha, theta);

% Tracer la densité de la distribution Gamma
figure;
plot(t, pdfValues, 'LineWidth', 2);
hold on;

% Marquer x sur le graphique
plot([x x], [0 max(pdfValues)], 'r--', 'LineWidth', 1.5);
text(x, 0.02, 'x', 'HorizontalAlignment', 'center', 'Color', 'red');

% Marquer x_anti sur le graphique
plot([x_anti x_anti], [0 max(pdfValues)], 'b--', 'LineWidth', 1.5);
text(x_anti, 0.02, 'x_{anti}', 'HorizontalAlignment', 'center', 'Color', 'blue');

% Marquer la médiane sur le graphique
plot([medianGamma medianGamma], [0 max(pdfValues)], 'g--', 'LineWidth', 1.5);
text(medianGamma, 0.02, 'Médiane', 'HorizontalAlignment', 'center', 'Color', 'green');

title('Densité de la distribution Gamma et points x, x_{anti}, et Médiane');
xlabel('Valeur');
ylabel('Densité de probabilité');
legend('Densité Gamma', 'x', 'x_{anti}', 'Médiane', 'Location', 'Best');
hold off;
