function x = simulate_affine_density(a, c, d)
    % Calculer b en utilisant l'intégrale de ax+b sur [c,d] = 1
    b = (1 - 0.5*a*(d^2 - c^2)) / (d - c);
    
    % Générer une variable aléatoire uniforme U
    U = rand();
    
    % Calculer la fonction de répartition inverse en résolvant F(x) = U pour x
    % La fonction de répartition F(x) est l'intégrale de (ax + b) de c à x,
    % ce qui donne (a/2)*(x^2 - c^2) + b*(x - c).
    % On résout (a/2)*(x^2 - c^2) + b*(x - c) = U pour x.
    % Simplification donne une équation quadratique en termes de x.
    
    % Coefficients de l'équation quadratique ax^2 + bx + c = 0
    A = 0.5*a;
    B = b - a*c;
    C = 0.5*a*c^2 - b*c - U;
    
    % Résoudre l'équation quadratique pour x
    x = max(roots([A, B, C])); % Choisir la racine qui est dans l'intervalle [c, d]
end
