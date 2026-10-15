function [L,D,p] = LDLTwithdiagpivot(A)
n = size(A,1);
L = eye(n);
D = zeros(n,1);
p = 1:n;
for j = 1:n-1
    [~,k] = max(abs(diag(A(j:n,j:n))));
    k = k + j - 1;
    A([j k],:) = A([k j],:);
    A(:,[j k]) = A(:,[k j]);
    L([j k],1:j-1) = L([k j],1:j-1);
    p([j k]) = p([k j]);
    D(j) = A(j,j);
    L(j+1:n,j) = A(j+1:n,j) / D(j);
    A(j+1:n,j+1:n) = A(j+1:n,j+1:n) - L(j+1:n,j)*D(j)*L(j+1:n,j)';
end
D(n) = A(n,n);
end