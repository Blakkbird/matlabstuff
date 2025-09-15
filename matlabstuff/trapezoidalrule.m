% Trapezoidal Rule Integration
clear all; clc;

f = @(x) x^2 - 4*x + 2;   

% Inputs
a = input('Enter lower limit a: ');   
b = input('Enter upper limit b: ');   
n = input('Enter number of subintervals n: '); 

h = (b - a) / n;   % step size

% Compute trapezoidal rule
sum = f(a) + f(b);
for i = 1:n-1
    xi = a + i*h;
    sum = sum + 2*f(xi);
end

I = (h/2) * sum;

fprintf("Approximate integral from %.2f to %.2f = %.6f\n", a, b, I);
