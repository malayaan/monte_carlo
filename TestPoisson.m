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
  tabX(index) = LoiPoisson(lambda);
end

% Tracé de l'histo.


moyenne = mean(tabX);
variance = std(tabX)^2;


sprintf('Moyenne calculée : %g -- Variance calculée : %g -- lambda : %g', moyenne, variance, lambda)


figure(1);
clf;

m = min(tabX);
M = max(tabX);
hist(tabX,M-m+1);

title ('Loi de Poisson simulée');
xlabel('Valeur de N');
ylabel('Nombre d''observations');
