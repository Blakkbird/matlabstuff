clc; clear;

A = [2 1; 
     1 3];

tol = 1e-10;
maxIter = 100;

A_k = A;

for k = 1:maxIter
    [Q, R] = qr(A_k);       % QR factorization
    A_new = R * Q;          % next iterate
    
    if norm(A_new - A_k, 'fro') < tol
        break
    end
    
    A_k = A_new;
end

disp("Approx eigenvalues (diagonal of A_k):")
diag(A_k)