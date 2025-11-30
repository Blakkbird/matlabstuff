clc; clear;

% ---------------------------------------
% Input your data here
% ---------------------------------------
x = [1 2 3 4 5]';    
y = [2 3 5 4 6]';    

n = length(x);

% ---------------------------------------
% Compute all required sums
% ---------------------------------------
Sx   = sum(x);
Sx2  = sum(x.^2);
Sx3  = sum(x.^3);
Sx4  = sum(x.^4);

Sy   = sum(y);
Sxy  = sum(x .* y);
Sx2y = sum((x.^2) .* y);

% ---------------------------------------
% Form the 3×3 normal equation system
% ---------------------------------------
A = [
    Sx4   Sx3   Sx2;
    Sx3   Sx2   Sx;
    Sx2   Sx    n
];

B = [
    Sx2y;
    Sxy;
    Sy
];

% Solve for a, b, c
p = A \ B;

a = p(1);
b = p(2);
c = p(3);

fprintf("Quadratic curve:  y = %.6f x^2 + %.6f x + %.6f\n", a, b, c);

figure;
plot(x, y, 'ro', 'MarkerSize', 8, 'LineWidth', 2); hold on;
plot(xx, yy, 'b-', 'LineWidth', 2);
grid on;

title('Least Squares Quadratic Fit');
xlabel('x');
ylabel('y');
legend('Data Points', 'Quadratic Fit');
