function koef = Njutn1()
  
  tablica;
  
  n = length(X);
  prazlike = zeros(n,n);
  
  prazlike(:,1) = F(:);
  for i=2:n
    prazlike(1:n-i+1,i) = diff(prazlike(1:n-i+2,i-1));
  endfor
  
  p = [1 0];
  Pn = F(1);
  
  for i=1:n-1
    Pn = [0 Pn] + p * prazlike(1, i+1) / factorial(i);
    p = conv(p, [1 -i]);
  endfor  
  
  koef = Pn;