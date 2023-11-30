% Use the function
Nvalues = 100:10000:100000;
Ivalues = zeros(size(Nvalues));
for iloop = 1:length(Nvalues)
    Ivalues(iloop) = MonIntegral2(Nvalues(iloop));
    iloop
end

plot(Nvalues,Ivalues);