function y = vredizvoda(x)
  
  [X,Y,Yi] = izvod();
  n = length(Yi);
  
  Xi = X([2:end-1]);
  pr = zeros(n, n);
  
  for i=1:n
    pr(i, 1) = Yi(i);
  endfor
  
  for j=2:n
    for i=j:n
      pr(i,j) = (pr(i, j-1) - pr(i - 1, j-1)) / (X(i + 1) - X(i - j + 2));
    endfor
  endfor
  
  disp(pr);
  
  y = pr(1,1);
  f = x - Xi(1);
  
  for i=2:n
    y = y + f * pr(i,i);
    f = f * (x - Xi(i));
  endfor
  
  
