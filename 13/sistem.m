function [A,b] = sistem(d,t,n)
    
    A = ones(1,n+1);
    g = @(x) t(x);
    f = @(x) 1;
    b = [integral(g,0,d)];
    
    for N=2:n+1
      g = @(x) g(x)*x;
      f = @(x) f(x)*x;
      b = [b;integral(g,0,d)];
      AN = zeros(1,n+1);
      for i=1:n+1
        AN(i) = f((i-1)*d/n);
      endfor
      A = [A;AN];
    endfor
