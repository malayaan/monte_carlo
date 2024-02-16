% Script de test de la loi binomiale


% Lecture des paramètres

lambda = -2;
while (lambda <=0)
  lambda = input('Entrer le paramètre lambda : ');
end

LX = round(input('Entrer le nombre de générations à effectuer : '));
sprintf('J''arrondis à L = %d\n',LX)



%  Simulation

tabX = zeros(1,LX);

for index = 1:LX
  tabX(index) = LoiExpo(lambda);
end

% Calcul de moyenne et variance, et tracé de fonctions de répartition.


moyenne = mean(tabX);
variance = std(tabX);


sprintf('Moyenne calculée : %g -- Ecart-type calculé : %g -- 1/lambda : %g', moyenne, variance, 1/lambda)


X = sort(tabX); % On trie le tableau de sorte que (tabX_i, i/LX) approche la fonction de répartition.

figure(1);
clf;
plot(X, (1:LX)/LX, 'b', X , 1 - exp(-lambda*X),'r');
xlabel('Valeur de X');
title('Fonction de répartition (Estimée en bleu, Théorique en rouge)');
