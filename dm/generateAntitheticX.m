function x_anti = generateAntitheticX(x, alpha, theta)
    % Calcul de la médiane comme pivot
    pivot = theta * gammaincinv(0.5, alpha);
    
    % Fonction de répartition (CDF) de la distribution Gamma
    F = @(y) gammainc(y / theta, alpha, 'lower');
    
    % Déterminer si x est au-dessus ou en dessous du pivot et définir les limites en conséquence
    if x > pivot
        targetArea = F(x) - F(pivot);
        lowerBound = 0;
        % Choisir une limite supérieure finie plutôt que 'inf'
        upperBound = pivot - 0.001; % Juste en dessous du pivot pour éviter le chevauchement
        % Fonction à minimiser
        objectiveFunction = @(y) abs((F(upperBound) - F(y)) - targetArea);
    else
        targetArea = F(pivot) - F(x);
        lowerBound = pivot;
        % Utiliser une valeur élevée mais finie pour upperBound
        upperBound = 100 * theta; % Une valeur suffisamment grande pour la plupart des cas d'utilisation
        % Fonction à minimiser
        objectiveFunction = @(y) abs(F(y)-(F(lowerBound)) - targetArea);
    
    end
    
    
    % Options d'optimisation
    options = optimset('Display', 'none');
    
    % Trouver x_anti
    x_anti = fminbnd(objectiveFunction, lowerBound, upperBound, options);
end
