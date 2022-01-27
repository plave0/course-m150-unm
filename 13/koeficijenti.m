function ci = koeficijenti(d,t,n)
  
  [A,b] = sistem(d,t,n);
  ci = A\b;