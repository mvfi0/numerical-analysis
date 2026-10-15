function [R,b] = MyQRfact(A,b)
[m,n] = size(A);
A = [A b];
for j = 1:n
    s = sign(A(j,j));
    if A(j,j) == 0
        s = 1;
    end
    v = A(j:m,j) + s*norm(A(j:m,j))*eye(m-j+1,1);
    d = 2/(v'*v);
    for k = j:n+1
        A(j:m,k) = A(j:m,k) - d*(v'*A(j:m,k))*v;
    end
end
R = A(:,1:n);
b = A(:,n+1);
end