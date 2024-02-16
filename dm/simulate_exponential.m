function y = simulate_exponential(mu, b)
    % Cette fonction simule une variable aléatoire suivant une densité
    % exponentielle décalée, définie par 1/b * exp(-(y-mu)/b) pour y > mu,
    % et zéro sinon.
    
    % Génère une variable aléatoire exponentielle avec le paramètre b
    exp_sample = exprnd(b);
    
    % Ajuste la variable aléatoire générée pour respecter la condition y > mu
    y = mu + exp_sample; % Décale la distribution pour commencer à mu
end
