clear; clc;
% gaussian elimination
n = input('Enter the number of equations (n): ');
disp('Enter the augmented matrix [A | b]: ');
A = input('A = ');

% Check matrix size
[m, p] = size(A);
if m ~= n || p ~= n + 1
    error('Matrix must be n x (n+1) — coefficient matrix with augmented column.');
end

% Upper Right Triangular Matrix 
for i = 1:n-1
    for j = i+1:n
        factor = A(j,i) / A(i,i);
        A(j,:) = A(j,:) - factor * A(i,:);
    end
end

disp('Upper Triangular Matrix after Forward Elimination:');
disp(A);

% Back subst.
X = zeros(n,1);
X(n) = A(n,n+1) / A(n,n);

for i = n-1:-1:1
    tempSum = 0;
    for j = i+1:n
        tempSum = tempSum + A(i,j) * X(j);
    end
    X(i) = (A(i,n+1) - tempSum) / A(i,i);
end

disp('Solution Vector X:');
disp(X);
