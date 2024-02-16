function [I, sigma2] = ApproxPisur4bis(N)
    S2 = 0;
    Ybar = 0;
    for n = 1:N
        X = rand (2,1);
        Xp = rand(2,1);
        Y = (X(1)^2 + X(2)^2 <= 1);
        Yp = (Xp(1)^2 + Xp(2)^2 <= 1);
        S2 = S2 + (Y-Yp)^2;
        Ybar = Ybar + Y + Yp;
    end
    I = Ybar/ (2*N);
    sigma2 = S2 / (2*N);
end
