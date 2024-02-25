function y = Fy_inverse_integral(mu, b, I_target)
    % Vérifier dans quel segment I_target se trouve
    if I_target < 0 || I_target > 1
        error('I_target doit être entre 0 et 1.');
    elseif I_target <= 0.5
        % Solution pour le deuxième segment
        y = sqrt(8*b^2*I_target) + mu - 2*b;
    else
        % Solution pour le troisième segment 
        y = mu - b * log(2-2*I_target);
    end
end
