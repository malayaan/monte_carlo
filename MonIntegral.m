function I = MonIntagral(N)
    % This function approximates the integral of cos(x^3)exp(-x) over [0, 1]
    % using the Monte Carlo method with N random samples.

    % Ensure that N is a positive integer
    assert(N > 0, 'N must be a positive integer');
    assert(floor(N) == N, 'N must be an integer');

    % Generate N uniform random samples from the interval [0, 1]
    random_samples = rand(N, 1);
    
    % Evaluate the integrand function at each random sample
    function_values = cos(random_samples.^3) .* exp(-random_samples);
    
    % Calculate the mean of these function values
    integral_mean = mean(function_values);
    
    % Approximate the integral
    I = integral_mean;
end
