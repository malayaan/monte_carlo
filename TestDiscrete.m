% Script de test de la variable aléatoire discrète personnalisée avec histogramme

% Lecture des valeurs et probabilités
x_values = [2, 4, 6]; % Exemple de valeurs
p_values = [0.3, 0.4, 0.3]; % Exemple de probabilités

LX = round(input('Entrer le nombre de générations à effectuer : '));
sprintf('J''arrondis à L = %d\n', LX)

% Simulation
tabX = zeros(1, LX);
for index = 1:LX
    tabX(index) = LoiDiscrete(x_values, p_values);
end

% Calcul de moyenne et écart-type
moyenne = mean(tabX);
ecart_type = std(tabX);

sprintf('Moyenne calculée : %g -- Ecart-type calculé : %g', moyenne, ecart_type)

% Affichage de l'histogramme
figure(1);
clf;
histogram(tabX, 'Normalization', 'probability');
xlabel('Valeur de X');
ylabel('Fréquence relative');
title('Histogramme des valeurs simulées');
