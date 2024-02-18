function x_anti = Fx_generate_Antithetic(x, alpha, theta)
    % Calcul de la médiane comme pivot
    pivot = Fx_inverse_integral(alpha, theta, 0.5);
    targetArea = abs(Fx_calc_integral(x,alpha,theta)-1/2);
    % Déterminer si y est dans la partie affine ou exponentielle
    if x > pivot
        x_anti=Fx_inverse_integral(alpha, theta, 1/2-targetArea);
    else
        x_anti=Fx_inverse_integral(alpha, theta, 1/2+targetArea);
    end
end
