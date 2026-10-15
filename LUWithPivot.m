function [L, U, p, flag] = LUWithPivot(A)
[n, n] = size(A);
L = eye(n);
p = [1:n];
flag = "non-singular";

for j = 1:n-1
    [v, k] = max(abs(A(j:n, j)));
    k = k+j-1;

    if v < 1e-16
        flag = "singular";
        break;
    end

    A([j k], :) = A([k j], :);
    L([j k], 1:j-1) = L([k j], 1:j-1);
    p([j k]) = p([k j]);

    for i = j+1:n
        L(i, j) = A(i, j)/A(j ,j);
        A(i, j:n) = A(i, j:n) - L(i, j)*A(j, j:n);
    end
end
U = A;