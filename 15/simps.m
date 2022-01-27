function I = simps(a,b,h,f)
  
  n = (b-a)/h + 1;
  X = linspace(a,b,n);
  Y = f(X);
  
  I = (h/3) * (Y(1) + Y(end) + 2*sum(Y(3:2:end-1)) + 4*sum(Y(2:2:end-1)));
