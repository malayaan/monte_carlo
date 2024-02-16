function I = ApproxPisur4(N)
    pointsDansDisque = 0;
    for i = 1:N
        X1 = 2*rand() - 1;
        X2 = 2*rand() - 1;
        if X1^2 + X2^2 <= 1
            pointsDansDisque = pointsDansDisque + 1;
        end
    end
    I = pointsDansDisque / N;
end
