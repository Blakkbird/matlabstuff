% Gauss-Seidel Method 
clc; clear all;

% user inputs
n = input('Enter the number of equations (n): ');

A = zeros(n,n);
b = zeros(n,1);

disp('Enter the coefficients of matrix A:');
for i = 1:n
    for j = 1:n
        A(i,j) = input(sprintf('A(%d,%d) = ', i, j));
    end
end

disp('Enter vector b:');
for i = 1:n
    b(i) = input(sprintf('b(%d) = ', i));
end

tol = input('Enter tolerance : ');
maxIter = input('Enter max num of iterations: ');

% Initial guess
x = zeros(n,1);

% Gauss-Seidel iteration
for k = 1:maxIter
    x_old = x;
    
    for i = 1:n
        % sum1: A(i,1:i-1)*x(1:i-1)
        sum1 = 0;
        for j = 1:i-1
            sum1 = sum1 + A(i,j)*x(j);
        end
        
        % sum2: A(i,i+1:n)*x_old(i+1:n)
        sum2 = 0;
        for j = i+1:n
            sum2 = sum2 + A(i,j)*x_old(j);
        end
        
        % Update x(i)
        x(i) = (b(i) - sum1 - sum2) / A(i,i);
    end
    
    % Display current iteration
    fprintf('Iteration %d: ', k);
    disp(x');
    
    % Check for convergence
    if norm(x - x_old, inf) < tol
        fprintf('\nConverged after %d iterations.\n', k);
        fprintf('Final Solution:\n');
        disp(x);
        return;
    end
end

warning('Did not converge within the maximum number of iterations.');
fprintf('Approximate solution after %d iterations:\n', maxIter);
disp(x);
