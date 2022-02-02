function B = num2(m,n,tol)
  
  f = @(x) x.^(m-1) .* (1 - x) .^ (n-1);
  
  n = 3;
  I1 = Simps(0, 1, n, f);
  n = 2*n - 1;
  I2 = Simps(0, 1, n, f);
  
  while abs(I1 - I2) / 15 > tol
    I1 = I2;
    n = 2*n - 1;
    I2 = Simps(0, 1, n, f);
  endwhile
  
  B = I2;
  
function I = Simps(a, b, n, f)
  
  X = linspace(a,b,n);
  Y = f(X);
  n = length(X);
  
  h = X(2) - X(1);
 
  I = (h / 3) * (Y(1) + Y(n) + 4 * sum(Y(2:2:n-1)) + 2*sum(Y(3:2:n-1)));