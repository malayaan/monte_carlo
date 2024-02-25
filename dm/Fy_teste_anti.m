% Paramètres pour la distribution mixte
mu = -13;
b = 2;

% Générer y aléatoirement en utilisant la fonction simulate_mixed_y
y = simulate_Y(mu, b);

% Générer y_anti en utilisant la fonction définie
y_anti = Fy_generate_Antithetic(y, mu, b);

% Définir une gamme de valeurs pour le tracé de la densité, s'arrêtant à mu-2b
t = linspace(mu-2*b, mu+10*b, 1000);

% Calculer la densité de probabilité pour ces valeurs
pdfValues = arrayfun(@(y) mixed_density(y, mu, b), t);

% Tracer la densité de la distribution mixte
figure;
plot(t, pdfValues, 'LineWidth', 2);
hold on;

% Marquer y sur le graphique
plot([y y], [0 max(pdfValues)], 'r--', 'LineWidth', 1.5);
text(y, 0.02, sprintf('y = %.2f', y), 'HorizontalAlignment', 'center', 'Color', 'red');

% Marquer y_anti sur le graphique
plot([y_anti y_anti], [0 max(pdfValues)], 'b--', 'LineWidth', 1.5);
text(y_anti, 0.02, sprintf('y_{anti} = %.2f', y_anti), 'HorizontalAlignment', 'center', 'Color', 'blue');

% Marquer mu sur le graphique
plot([mu mu], [0 max(pdfValues)], 'g--', 'LineWidth', 1.5);
text(mu, 0.02, sprintf('\\mu = %.2f', mu), 'HorizontalAlignment', 'center', 'Color', 'green');

title('Densité de la distribution mixte et points y, y_{anti}, et \mu');
xlabel('Valeur');
ylabel('Densité de probabilité');
legend('Densité mixte', 'y', 'y_{anti}', '\mu', 'Location', 'Best');
hold off;

% Fonction pour calculer la densité de probabilité mixte
function f = mixed_density(y, mu, b)
    if y < mu
        f = (y - mu + 2*b) / (4*b^2); % Partie affine
    else
        f = (1 / (2*b)) * exp(-(y - mu) / b); % Partie exponentielle
    end
end