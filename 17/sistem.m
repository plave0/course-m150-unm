function [iter x] = sistem(A,b,tol)
  
  if(dominantna(A) == 0)
    error("Matrica nije dijagonalno dominantna");
  else
    
    [n,m] = size(A);
    A1 = zeros(n,n);
    
    for i=1:n
      A1(i,:) = A(i,:) * -1 / A(i,i);
      A1(i,i) = 0;
      b(i) = b(i) / A(i,i);
    endfor
  endif
  
  q = norm(A1, inf);
  tol = tol * (1-q) / q;
  
  x0 = b;
  x1 = x0;
  iter = 1;
  
  while 1
    for i=1:n
      x1(i) = A1(i,:) * x1 + b(i);
    endfor
    iter = iter + 1;
    
    if all(abs(x1 - x0) < tol)
      break;
    endif
    
    x0 = x1;
    
  endwhile
  
  x = x1;
  
  % a11 * x1 + a12 * x2 + a13 * x3 = b1
  % x1 = (b1 - a12 * x2 - a13 * x3) / a11