function y = inverse_integral_f(mu, b, I_target)
    % Vérifier dans quel segment I_target se trouve
    if I_target < 0 || I_target > 1
        error('I_target doit être entre 0 et 1.');
    elseif I_target == 0
        y = mu - 2*b; % Limite inférieure du premier segment non constant
    elseif I_target <= 0.5
        % Solution pour le deuxième segment
        y = sqrt(8*b^2*I_target) + mu - 2*b;
    else
        % Solution pour le troisième segment utilisant une méthode numérique
        fun = @(y) 0.5 + ((2*b)^2) / (8*b^2) - 0.5 * exp(-(y - mu) / b) - I_target;
        y_initial = mu; % Point de départ pour la recherche de la solution
        y = fzero(fun, y_initial);
    end
end
