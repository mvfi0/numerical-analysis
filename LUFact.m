function [L,U] = LUfact(A)
[n,n] = size(A);
L = eye(n);
for j = 1:n-1
    for i = j+1:n
        r = A(i,j) / A(j,j);
        L(i,j) = r;
        A(i,j:n) = A(i,j:n) - r * A(j,j:n);
    end
end
U = A;