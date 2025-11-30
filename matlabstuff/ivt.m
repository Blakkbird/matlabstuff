% IVT algorithm to find subintervals [a, b] where f(x) = 0 has a root
clear; clc;

f = @(x) x.^2 - 29;  % choose any

N = 10;     % Search from -N to N
h = 1;      % Step size

fprintf("Intervals containing roots:\n");

% IVT Scan
for i = -N : h : (N - h) % because we check from x to x+h so loop end at N-h
    if f(i) * f(i + h) < 0
        a = i;
        b = i + h;
        fprintf('[%g , %g]\n', a, b);
    end
end
