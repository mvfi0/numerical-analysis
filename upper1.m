function x = upper1(U,b)
n = length(b);
x = zeros(n,1);
for i = n:-1:1
    sum = U(i,i+1:n)*x(i+1:n);
    x(i)=(b(i)-sum)/U(i,i);
end