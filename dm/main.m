% Nombre de tirages à générer
N = 10000;

% Paramètres pour la distribution mixte
mu = -12; % Exemple de valeur
b = 2;  % Exemple de valeur

% Initialisation du vecteur pour stocker les tirages
y_samples = zeros(N, 1);

% Génération des tirages
for i = 1:N
    y_samples(i) = simulate_mixed_y(mu, b);
end

% Création de l'histogramme des tirages
figure;
histogram(y_samples, 50, 'Normalization', 'pdf');
title('Histogramme de la distribution mixte de Y');
xlabel('Valeur de Y');
ylabel('Densité');
