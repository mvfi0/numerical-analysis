function [L,D] = LDLTfact(A)
n = size(A,1);
L = eye(n);
D = zeros(n,1);
for j = 1:n-1
    D(j) = A(j,j);
    L(j+1:n,j) = A(j+1:n,j) / D(j);
    A(j+1:n,j+1:n) = A(j+1:n,j+1:n) - L(j+1:n,j)*D(j)*L(j+1:n,j)';
end
D(n) = A(n,n);
end