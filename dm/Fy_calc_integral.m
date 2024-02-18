function F = Fy_calc_integral(mu, b, y)
    % calc_F Calcule la valeur de la primitive F en fonction de mu, b et y
    if y < mu - 2*b
        F = 0;
    elseif y < mu
        F = ((y - mu + 2*b)^2) / (8*b^2);
    else
        F = 1 - 1/2 * exp(-(y - mu) / b);
    end
end
