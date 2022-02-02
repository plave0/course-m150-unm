function x = num1()
  
  podaci;
  
  h = @(x) f(x) - g(x);
  Y = h(X);
  n = length(X);
  
  krazlike = zeros(n,n-1);
  krazlike(1:n-1, 1) = diff(Y);
  
  for j=2:n-1
    krazlike(1:n-j, j) = diff(krazlike(1:n-j+1,j-1));
  endfor
  
  h = X(2) - X(1);
  
  fi = [0 -Y(1)];
  Q = conv([1 0], [1 -1]);
  
  for i=2:n-1
    fi = [0 fi] - Q * krazlike(1,i) / factorial(i);
    Q = conv(Q, [1 -i]); 
  endfor
  fi = fi / krazlike(1,1);
  
  fi = @(q) polyval(fi,q);
  
  q0 = 0;
  q1 = fi(q0);
  while abs(q1 - q0) > 1e-5
    q0 = q1;
    q1 = fi(q0);
  endwhile
  
  x = X(1) + q1 * h;
  
  
  
  
