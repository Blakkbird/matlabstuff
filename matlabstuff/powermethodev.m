clc; clear;

A = [2 1; 
     1 3];

x = [1; 1];      % initial vector
tol = 1e-6;
maxIter = 100;

for k = 1:maxIter
    y = A * x;
    x_new = y / norm(y);
    lambda = x_new' * A * x_new;

    if norm(x_new - x) < tol
        break
    end
    
    x = x_new;
end

fprintf("Dominant eigenvalue: %.6f\n", lambda);
fprintf("Eigenvector:\n");
disp(x_new);
