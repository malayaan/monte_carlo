function I = MonIntegral2(N)
    % This function approximates the integral of cos(x^3)exp(-x) over [0, 1]
    % using the Monte Carlo method with N random samples.

    % Initialize sum to zero
    sum_val = 0;
    
    % Loop over N to compute the sum
    for i = 1:N
        % Generate a uniform random sample from the interval [0, 1]
        random_sample = random('exp',1);
        
        % Evaluate the integrand function at the random sample
        function_value = cos((random_sample)^3) * (random_sample<1);
        
        % Update the sum
        sum_val = sum_val + function_value;
    end
    
    % Calculate the mean of these function values
    integral_mean = sum_val / N;
    
    % Approximate the integral
    I = integral_mean;
end


