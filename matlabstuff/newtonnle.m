% Newton's method for a system of nonlinear equations
clear; clc;

F = @(x) [
    x(1)^2 + x(2)^2 - 4;        % Example equation 1
    exp(x(1)) + x(2) - 1        % Example equation 2
];

% Define Jacobian J(x) 
J = @(x) [
    2*x(1),      2*x(2);        % partial derivatives of eqn 1
    exp(x(1)),   1              % partial derivatives of eqn 2
];

% guess
x = [1; 1];

tol = 1e-6;
maxIter = 50;

fprintf("Iter      x1              x2\n");

for k = 1:maxIter
    
    Fx = F(x);
    Jx = J(x);
    
    % x(k+1) = x(k) - inv(J)*F(k)

    dx = - Jx \ Fx;     % same as Jacobian inv X F(x)
    
    x_new = x + dx;
    
    fprintf("%d   %f   %f\n", k, x_new(1), x_new(2));
    
    % Convergence test
    if norm(dx, 2) < tol
        fprintf("\nSolution found:\n");
        disp(x_new);
        return;
    end
    
    x = x_new;
end

fprintf("\nDid not converge within %d iterations.\n", maxIter);
