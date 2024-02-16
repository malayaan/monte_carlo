Nvalues = 10:1000:100000;
Ivalues = zeros(size(Nvalues)); 
sigma2values = zeros(size(Nvalues)); 
for iloop = 1:length(Nvalues)
    [I, sigma2] = ApproxPisur4bis(Nvalues(iloop));
    Ivalues(iloop) = I;
    sigma2values(iloop) = sigma2;
end

subplot(2,1,1); 
plot(Nvalues, Ivalues);
title('Approximation de \pi/4 en fonction de N');
xlabel('N');
ylabel('Approximation de \pi/4');
subplot(2,1,2);
plot(Nvalues, sigma2values);
title('Estimation de la variance en fonction de N');
xlabel('N');
ylabel('Variance');
