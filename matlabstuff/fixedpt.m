% Fixed Point Iteration Method (Robust)
clear all; clc;
syms x;

f = x^2 - 4*x + 2;
% Rearrange as x = g(x)
g= (x^2 + 2)/4;  

% Convert to function handles
f = matlabFunction(f);
g = matlabFunction(g);
dg = matlabFunction(diff(g, x)); % derivative of g(x)
fprintf("f(x) = %s\n", char(f));
fprintf("g(x) = %s\n", char(g));

x0 = input("Enter initial guess: ");
tol = input("Tolerance: ");

% Check convergence criterion |g'(x)| < 1 near initial guess
if abs(g(x0)) >= 1
    warning('Convergence not guaranteed: |g''(x0)| >= 1');
end

% Iteration
while true
    i = i + 1;
    x1 = g(x0);
    
    if abs(x1 - x0) < tol
        break;
    end
    
    x0 = x1;
end

fprintf("Root is approximately %.6f after %d iterations.\n", x1, i);

