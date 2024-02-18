function x_anti = generateAntitheticX(x, alpha, theta)
    % Calculer le point central
    centralPoint = alpha * theta;
    
    % Vérifier la condition et calculer l'aire cible
    if x > centralPoint
        targetArea = integral(@(t)gampdf(t,alpha,theta), centralPoint, x);
        % Trouver x_anti par recherche numérique
        fun = @(y)integral(@(t)gampdf(t,alpha,theta), y, centralPoint) - targetArea;
        x_anti = fzero(fun, 0);
    else
        targetArea = integral(@(t)gampdf(t,alpha,theta), x, centralPoint);
        % Trouver x_anti par recherche numérique
        fun = @(y)integral(@(t)gampdf(t,alpha,theta), centralPoint, y) - targetArea;
        x_anti = fzero(fun, 2*centralPoint); % Recherche dans la direction opposée
    end
end
