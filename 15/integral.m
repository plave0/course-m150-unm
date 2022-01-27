function I = integral(n,m,tol)
  
  P = polinom(n,m);
  P = @(x) polyval(P,x).*exp(x);
  h = 1;
  I1 = simps(-1,1,h,P);
  h = h/2;
  I2 = simps(-1,1,h,P);
  while(abs(I1-I2)>tol)
    I1 = I2;
    h = h/2;
    I2 = simps(-1,1,h,P);
  end
  
  I = I2;
  