function [pi_approx, variance] = integrateur_m_c_antithetique(N)
    % Estimation de π/4 par la méthode de Monte Carlo avec variables antithétiques
    % N est le nombre total de points (doit être pair)
    % 'pi_approx' est l'estimation de π/4
    % 'variance' est la variance de l'estimation

    % Assurer que N est pair
    N = ceil(N/2) * 2;

    % Initialiser le compteur pour les points à l'intérieur du quart de cercle
    compteur = 0;
    
    % Initialiser la somme pour le calcul de la variance
    sum_var = 0;

    % Générer des points et leurs antithétiques
    for i = 1:N/2
        x = rand();
        y = rand();

        % Vérifier si (x, y) est à l'intérieur du quart de cercle
        if x^2 + y^2 <= 1
            compteur = compteur + 1;
        end

        % Point antithétique
        x_ant = 1 - x;
        y_ant = 1 - y;

        % Vérifier si (x_ant, y_ant) est à l'intérieur du quart de cercle
        if x_ant^2 + y_ant^2 <= 1
            compteur = compteur + 1;
        end

        % Mise à jour de la somme pour le calcul de la variance
        sum_var = sum_var + ((x^2 + y^2 <= 1) - (x_ant^2 + y_ant^2 <= 1))^2;
    end

    % Calcul de l'estimation de π/4
    pi_approx = compteur / N;

    % Calcul de la variance
    variance = sum_var / (N/2);
end