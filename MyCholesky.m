function G = MyCholesky(A)
n = size(A,1);
G = zeros(n);
for j = 1:n
    r = A(j,j) - G(j,1:j-1)*G(j,1:j-1)';
    if r <= 0
        error('Matrix is not positive definite');
    end
    G(j,j) = sqrt(r);
    for i = j+1:n
        G(i,j) = (A(i,j) - G(i,1:j-1)*G(j,1:j-1)') / G(j,j);
    end
end
end