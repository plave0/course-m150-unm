function inverzna = inverz(A)
  
  [n,m] = size(A);
  
  I = eye(n);
  
  A1 = zeros(n,0);
  for i=1:m
    x =  LUdekompozicija(A,I(:,i));
    A1 = [A1 x];
  endfor
  
  inverzna = A1;
