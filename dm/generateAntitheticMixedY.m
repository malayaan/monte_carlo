function y_anti = generateAntitheticMixedY(y, mu, b)
    % La médiane est donnée par le paramètre mu
    targetArea = abs(calc_integral(mu, b, y)-1/2);
    % Déterminer si y est dans la partie affine ou exponentielle
    if y > mu
        y_anti=inverse_integral_f(mu, b,1/2-targetArea);
    else
        y_anti=inverse_integral_f(mu, b,1/2+targetArea);
    end
end
