function [x0, n] = Newton1(f, df, x0, tol, max)
f0 = f(x0);
n = 0;
while abs(f0) > tol && n < max
    x0 = x0 - f(x0) / df(x0);
    f0 = f(x0);
    n = n + 1;
end
