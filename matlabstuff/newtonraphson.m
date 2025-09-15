% Newton–Raphson Method
clear all; clc;
syms x; % symbolic stuff 

f=@(x) x^2 - 4*x + 2;

df = diff(f, x);            


fprintf("f(x) = %s\n", char(f));
fprintf("f'(x) = %s\n", char(df));

x0 = input("Enter initial guess: ");
tol = input("Tolerance: ");


i = 0;
while true
    i = i + 1;
    x1 = x0 - f(x0)/subs(df, x0);   % use subs else make df symbolic too using matlabFunction
    
    if abs(x1 - x0) < tol    
        break;
    end
    x0 = x1;
end

fprintf("Root is approximately %.6f after %d iterations.\n", x1, i);
