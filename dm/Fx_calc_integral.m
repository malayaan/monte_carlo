function F = Fx_calc_integral(x, alpha, theta)
    % Fx_calc_integral Calcule la fonction de répartition de la loi Gamma
    % en utilisant la fonction gamma incomplète normalisée.
    % Entrées:
    % - x : Point où la CDF est évaluée
    % - alpha : Paramètre de forme
    % - theta : Paramètre d'échelle
    %
    % Sortie:
    % - F : Valeur de la CDF de la loi Gamma en x

    % Vérification que x est positif, car la CDF de la loi Gamma est définie pour x > 0
    if x < 0
        F = 0; % La CDF est 0 pour x < 0
    else
        % Calcul de la CDF en utilisant la fonction gamma incomplète normalisée
        % Note : gammainc utilise le deuxième paramètre x/theta pour l'échelle
        F = gammainc(x / theta, alpha);
    end
end
