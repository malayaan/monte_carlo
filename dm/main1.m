% Définir les paramètres
alpha = 3;
theta = 2;
mu = -13;
b = 2;

% Nombre de simulations
N = 10000;

% Initialiser les vecteurs de stockage pour les échantillons
x_samples = zeros(1, N);
y_samples = zeros(1, N);

% Générer des échantillons en boucle
for i = 1:N
    x_samples(i) = simulate_gamma_x(alpha, theta);
    y_samples(i) = simulate_mixed_y(mu, b);
end

% Histogramme pour X
figure;
subplot(1,2,1); % Permet de placer deux graphiques côte à côte
histogram(x_samples, 'Normalization', 'pdf');
hold on;
x_theo = 0:0.1:max(x_samples);
y_theo_x = (1/(gamma(alpha)*theta^alpha)) .* x_theo.^(alpha-1) .* exp(-x_theo/theta);
plot(x_theo, y_theo_x, 'r', 'LineWidth', 2);
title('Histogramme et densité théorique de X');

% Histogramme pour Y
subplot(1,2,2);
histogram(y_samples, 'Normalization', 'pdf');
hold on;
y_range = min(y_samples):(max(y_samples)-min(y_samples))/100:max(y_samples);
pdf_y = @(y) ((y-mu+2*b)./(4*b^2).*(y<mu)) + ...
             (1/(2*b).*exp(-(y-mu)./b).*(y>=mu));
y_theo_y = arrayfun(pdf_y, y_range);
plot(y_range, y_theo_y, 'r', 'LineWidth', 2);
title('Histogramme et densité théorique de Y');

% Afficher les graphiques
hold off;
