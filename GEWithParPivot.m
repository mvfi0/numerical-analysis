function [U, b1] = GEWithParPivot(A, b)
n = length(b);
C = [A b];
for j=1:n-1
    [v, k] = max(abs(C(j:n, j)));
    k = k+j-1;
    C([j k], :) = C([k j], :);
    for i=j+1:n
        r = C(i, j)/C(j, j);
        C(i, j:n+1) = C(i, j:n+1) - r*C(j, j:n+1);
    end
end
U = C(:, 1:n);
b1 = C(:, n+1);