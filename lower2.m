function x = lower2(L, b)
n = length(b);
x = zeros(n, 1);
for i = 1:n
    sum = L(i, 1:i-1) * x(1:i-1);
    x(i) = (b(i) - sum) / L(i,i);
end