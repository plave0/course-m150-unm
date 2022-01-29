function [F P] = notnum(f) 
  
  n = length(f);
  
  P = [1];
  for i=1:n
    P = conv(P, [(-1)^i 0 -f(i)]);
  endfor
  
  a = ceil(max(f));
  
  F = ones(n,n);
  A0 = a .^ (0:n-1);
  A = A0;
  for i=2:n
    F(i,:) = A;
    A = A .* A0;
  endfor
