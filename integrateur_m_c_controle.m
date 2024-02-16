function [integral_vc, S2_vc] = integrateur_m_c_controle(N)
    % Méthode de Monte Carlo avec variables de contrôle
    % N est le nombre d'échantillons (doit être pair)
    % 'integral_vc' est la valeur estimée de l'intégrale avec variables de contrôle
    % 'S2_vc' est la variance de l'estimation avec variables de contrôle

    % Assurer que N est pair
    N = ceil(N/2) * 2;

    % Initialisation de la somme et de la somme pour le calcul de la variance
    sum_val_vc = 0;
    sum_var_vc = 0;

    % Boucle sur N/2 pour calculer la somme et la variance
    for i = 1:N/2
        % Générer deux échantillons aléatoires uniformes dans [0, 1]
        x1 = rand();
        x2 = rand();

        % Évaluation de la fonction intégrande à l'aide de h(x)
        y1 = exp(x1^2)-(1 + x1^2);
        y2 = exp(x2^2)-(1 + x2^2);

        % Mise à jour de la somme
        sum_val_vc = sum_val_vc + y1 + y2;

        % Mise à jour de la somme pour le calcul de la variance
        sum_var_vc = sum_var_vc + (y1 - y2)^2;
    end

    % Calcul de la moyenne avec variables de contrôle
    integral_vc = sum_val_vc / N+4/3;

    % Calcul de la variance avec variables de contrôle
    S2_vc = sum_var_vc / N;
end
