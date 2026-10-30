function [x0, n] = Newton2(f, x0, tol, max)
h = 0.1e-5;
n = 0;
f0 = f(x0);
while abs(f0) > tol && n < max
  fph = f(x0 + h);
  x0 = x0 - h*f0 / (fph - f0);
  f0 - f(x0);
  n = n + 1;
end
