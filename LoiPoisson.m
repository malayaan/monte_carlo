function N = LoiPoisson(lambda)
    % Initialisation
    N = 0;      % Compteur d'événements
    S = 0;      % Somme des variables exponentielles

    % Boucle pour cumuler les variables exponentielles jusqu'à dépasser lambda
    while S < lambda
        E = -log(rand)/1;  % Générer une variable aléatoire exponentielle de paramètre 1
        S = S + E;         % Ajouter la variable exponentielle à la somme
        N = N + 1;         % Incrémenter le compteur
    end

    N = N - 1; 
end
