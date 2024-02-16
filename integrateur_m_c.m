function [integral, S2] = integrateur_m_c(N)
    % This function approximates an integral over [0, 1]
    % using the Monte Carlo method with N random samples.
    N=ceil(N/2)*2;
    % Initialize sum to zero
    sum_val = 0;
    S2=0;
    % Loop over N to compute the sum
    for i = 1:(N/2)
        % Generate a uniform random sample from the interval [0, 1]
        x1 = rand;
        x2 = rand;
        % Evaluate the integrand function at the random sample
        y1= exp(x1^2);
        y2= exp(x2^2);
        % Update the sum
        sum_val = sum_val + y1+ y2;
        S2 = S2 + (y1-y2)^2;
    end
    
    % Calculate the mean of these function values
    integral = sum_val / N;
    
    % Approximate the integral
    S2 = S2/N;
end


