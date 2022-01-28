function x = LUdekompozicija(A,b)
  
  [L,U,P] = lu(A);
  
  b = P * b;
  
  [n,m] = size(A);
 
  Y = zeros(n,1);
  for i=1:n
    Y(i) = (b(i) - L(i,:) * Y) / L(i,i);
  endfor
  
  X = zeros(n,1);
  for i=n:-1:1
    X(i) = (Y(i) - U(i,:) * X) / U(i,i);
  endfor
  
  x = X;
  