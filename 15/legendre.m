function L = legendre(n)
  
  L0 = [0];
  L1 = [1];
  L2 = [1 0];
  
  for i=2:n
    L0 = L1;
    L1 = L2;
    L2 = ((2*i-1) * [L1 0] - (i-1)*[0 0 L0])/i;
  endfor
  
  L = L2;
