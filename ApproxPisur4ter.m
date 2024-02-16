function [I, sigma2, N] = ApproxPisur4ter(delta, alpha)
    c = norminv(1 - alpha/2);
    S2 = 0;
    Ybar = 0;
    n = 1;
    while ((2 * n) < (c^2 * S2 / delta^2) || S2 ==0)
        X = rand(2, 1);
        Xp = rand(2, 1);
        Y = (X(1)^2 + X(2)^2 <= 1);
        Yp = (Xp(1)^2 + Xp(2)^2 <= 1);
        Ybar = Ybar + Y + Yp;
        S2 = (2 * n * S2 + (Y - Yp)^2) / (2 * (n + 1));
        n = n + 1;
    end
    N = 2 * n;
    I = Ybar / N;
    sigma2 = S2;
    
end
