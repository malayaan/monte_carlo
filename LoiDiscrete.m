function x = LoiDiscrete(x_values, p_values)
    u = rand;  % Générer un nombre aléatoire u dans [0,1]
    cumul = 0; % Variable pour le cumul des probabilités

    for i = 1:length(p_values)
        cumul = cumul + p_values(i);
        if cumul >= u
            x = x_values(i);
            return;
        end
    end
end
