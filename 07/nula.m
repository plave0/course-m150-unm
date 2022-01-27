function x = nula()
  
  [X,Y,Yi] = izvod();
  
  n = length(Yi);
  Xi = X([2:end-1]);
  
  [Yi, I] = sort(Yi);
  Xi = Xi(I);
  
  
  pr = zeros(n, n);
  for i=1:n
    pr(i,1) = Xi(i);
  endfor
  
  for j=2:n
    for i=j:n
      pr(i,j) = (pr(i, j-1) - pr(i-1,j-1)) / (Yi(i) - Yi(i-j+1));
    endfor
  endfor
  
  x = pr(1,1);
  f = -Yi(1);
  
  for i=2:n
    x = x + f * pr(i,i);
    f = f * (-Yi(i));
  endfor
  