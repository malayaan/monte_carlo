% Définir les valeurs de delta et alpha pour le test
deltaValues = [0.01, 0.005, 0.001]; % Différentes précisions
alpha = 0.05; % Niveau de confiance

% Initialiser les tableaux pour stocker les résultats
Ivalues = zeros(size(deltaValues));
sigma2values = zeros(size(deltaValues));
Nvalues = zeros(size(deltaValues));

% Tester la fonction avec différentes valeurs de delta
for iloop = 1:length(deltaValues)
    [I, sigma2, N] = ApproxPisur4ter(deltaValues(iloop), alpha);
    Ivalues(iloop) = I;
    sigma2values(iloop) = sigma2;
    Nvalues(iloop) = N;
end

% Tracer l'approximation de π/4
subplot(2,1,1); 
plot(deltaValues, Ivalues);
title('Approximation de \pi/4 en fonction de \delta');
xlabel('\delta');
ylabel('Approximation de \pi/4');

% Tracer l'estimateur de la variance
subplot(2,1,2);
plot(deltaValues, sigma2values);
title('Estimation de la variance en fonction de \delta');
xlabel('\delta');
ylabel('Variance');
