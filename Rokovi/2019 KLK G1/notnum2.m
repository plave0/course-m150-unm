function [M, trM] = notnum2(n)
  
  M = zeros(n,n);
  for i=1:n
    for j=1:n
      M(i,j) = ceil(log2(i*j));
    endfor
  endfor
  
  trM = sum(diag(M));
