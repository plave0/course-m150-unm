function I = num(n)
  
  podaci;
  
  C = cell(1,n);
  C{1} = [1];
  C{2} = [1 0];
  
  for i=3:n+1
    C{i} = 2 * [C{i-1} 0] - [0 0 C{i-2}];
  endfor
  
  celldisp(C);
  
  A = zeros(n);
  b = zeros(n,1);
  r = roots(C{n+1});
  
  g = @(x) 1./sqrt(1-x.^2);
  
  for i=1:n
    A(i,:) = g(r);
    b(i) = integral(g,-1,1);
    g = @(x) g(x) .* x; 
  endfor
 
  f = @(x) f(x)./sqrt(1 - x.^2);
  c = A\b;
  I = sum(c .* f(r));
  
  X = linspace(-1,1);
  hold on
  for i=2:2:n+1
    plot(X, polyval(C{i},X));
  endfor
  hold off
