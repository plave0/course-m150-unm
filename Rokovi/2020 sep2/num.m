function [L x] = num(g,y)
  
  podaci;
  
  n = length(X);
  
  s = sum(X) / n;
  X = X(find(X > s));
  Y = g(X);
  
  n = length(X);
  
  L = 0;
  for i=1:n
    p = 1;
    for j=1:n
      if i~=j
        p = conv(p, [1 -Y(j)]) / (Y(i) - Y(j));
      endif
    endfor
    
    L = L + p * X(i);
  endfor
  
  x = polyval(L, y);
  
  a = min(Y);
  b = max(Y);
  X = linspace(a,b);
  Y = polyval(L,X);
 
  hold on
  plot(X, polyval(L,X));
  plot([y y], [min(Y) max(Y)]);
  hold off
  
  