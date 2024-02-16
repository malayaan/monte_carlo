% Paramètres spécifiques pour la distribution
a = 6.5; % Exemple de valeur pour a
c = -17;   % Borne inférieure de l'intervalle
d = -13;   % Borne supérieure de l'intervalle
n = 10000; % Nombre de tirages

% Initialisation du vecteur pour stocker les tirages
samples = zeros(n, 1);

% Génération des tirages
for i = 1:n
    samples(i) = simulate_affine_density(a, c, d);
end

% Tracé de l'histogramme des tirages
histogram(samples, 50, 'Normalization', 'pdf');
hold on;

% Calcul de b pour la superposition de la densité théorique
b = (1 - 0.5*a*(d^2 - c^2)) / (d - c);

% Tracé de la densité théorique
x_values = linspace(c, d, 1000);
y_values = a*x_values + b;
plot(x_values, y_values, 'r-', 'LineWidth', 2);

% Configuration du graphique
title('Comparaison de l''histogramme des tirages et la densité théorique');
xlabel('Valeur');
ylabel('Densité');
legend('Tirages simulés', 'Densité théorique');

hold off;
