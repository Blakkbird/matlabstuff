% bisection method 
clear all; clc;
f = @(x) x^2 - 4*x + 2;
fprintf("Enter interval endpoints:\n");
a = input("a : ");
b = input("b : ");

if f(a) * f(b) > 0
    fprintf("You picked wrong interval, mf\n");
    return;  % end 
end

tol = input("Tolerance : ");

% maximum iterations
iter = ceil(log(abs(b-a)/tol) / log(2)); % or while abs(b-a) > tol

for i = 1:iter
    c = (a+b)/2;
    if f(a) * f(c) < 0
        b = c;
    else
        a = c;
    end
end

root = (a+b)/2;
fprintf("Root is approximately %.6f after %d iterations.\n", root, i);
