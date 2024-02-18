function y_anti = Fy_generate_Antithetic(y, mu, b)
    % La médiane est donnée par le paramètre mu
    targetArea = abs(Fy_calc_integral(mu, b, y)-1/2);
    % Déterminer si y est dans la partie affine ou exponentielle
    if y > mu
        y_anti=Fy_inverse_integral(mu, b,1/2-targetArea);
    else
        y_anti=Fy_inverse_integral(mu, b,1/2+targetArea);
    end
end
