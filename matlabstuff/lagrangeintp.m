% Lagrange Interpolation
clear all; clc;

% Input data points
X = input('Enter x values as a vector: ');   % e.g. [1 2 3]
Y = input('Enter y values as a vector: ');   

n = length(X);

syms x;
P = 0; % Initialize polynomial

for i = 1:n
    % Build L_i(X)
    Li = 1;
    for j = 1:n
        if j ~= i
            Li = Li * (x - X(j)) / (X(i) - X(j));
        end
    end
    
    % Add term y_i * L_i
    P = P + Y(i) * Li;
end

P = expand(P); % Expand polynomial nicely else big fraction is printed

fprintf("Lagrange interpolating polynomial : \n");
disp(P);

% Evaluate at a point
X_val = input('Enter point to evaluate polynomial: ');
y_val = double(subs(P, x, X_val)); % substitue expr var val

fprintf("P(%.4f) = %.6f\n", X_val, y_val);

% Optional: Plot
fplot(P, [min(X)-1, max(X)+1], 'r', 'LineWidth', 1.5); hold on;
plot(X, Y, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'b');
title('Lagrange Interpolation');
xlabel('x'); ylabel('y');
grid on;
