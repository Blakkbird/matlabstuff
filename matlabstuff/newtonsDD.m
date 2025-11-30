% NEWTON'S DIVIDED DIFFERENCE METHOD
% For interpolating polynomial through (x0, y0), (x1, y1), ..., (xn, yn)

clc; clear; close all;

n = input('Enter number of data points (n+1): ') - 1;
x = zeros(1, n+1);
y = zeros(1, n+1); % (x0,y0), (x1,y1),....(xn,yn)

fprintf('\nEnter data points:\n');
for i = 1:n+1
    x(i) = input(sprintf('x(%d): ', i)); % s so we can capture vars
    y(i) = input(sprintf('y(%d): ', i));
end

% table
dd = zeros(n+1, n+1);     % dd(i,j): jth order divided diff starting at i
dd(:,1) = y(:);            % first column = f(x)

for j = 2:n+1              % order of difference
    for i = 1:(n-j+2)
        dd(i,j) = (dd(i+1,j-1) - dd(i,j-1)) / (x(i+j-1) - x(i));
    end
end

% Display divided difference table
fprintf('\nDivided Difference Table:\n');
disp(dd);

% construct polynomial
% Symbolic representation for clarity
syms X;
P = dd(1,1);    % Start with f[x0]

term = 1;
for j = 1:n
    term = term * (X - x(j));   % (X - x0)(X - x1)... progressively
    P = P + dd(1,j+1) * term;
end

fprintf('\nInterpolating Polynomial:\n');
pretty(expand(P))

% ---- EVALUATION ----
x_val = input('\nEnter the value of x for interpolation: ');
y_val = double(subs(P, X, x_val));
fprintf('Value of interpolating polynomial at x = %.4f is %.6f\n', x_val, y_val);

% ---- PLOT ----
x_plot = linspace(min(x), max(x), 200);
y_plot = double(subs(P, X, x_plot));

figure;
plot(x, y, 'ro', 'MarkerFaceColor','r', 'DisplayName','Data Points');
hold on;
plot(x_plot, y_plot, 'b-', 'LineWidth',1.5, 'DisplayName','Interpolating Polynomial');
legend('Location','best');
xlabel('x'); ylabel('y');
title('Newton''s Divided Difference Interpolation');
grid on;
