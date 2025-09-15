% Simpson's 1/3 Rule Integration
clear all; clc;

f = @(x) x^2 - 4*x + 2;   

% Inputs
a = input('Enter lower limit a: ');   
b = input('Enter upper limit b: ');   
n = input('Enter number of subintervals (even) n: '); 

if mod(n,2) ~= 0
    error('n must be even for Simpson''s 1/3 rule.');
end

h = (b - a) / n;   % step size

% Compute Simpson's rule
sum = f(a) + f(b);
for i = 1:n-1
    xi = a + i*h;
    if mod(i,2) == 0
        sum = sum + 2*f(xi);  % even index
    else
        sum = sum + 4*f(xi);  % odd index
    end
end

I = (h/3) * sum;

fprintf("Approximate integral from %.2f to %.2f = %.6f\n", a, b, I);
