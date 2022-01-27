function [X, Y, Yi] = izvod()
  
  tablica;
  n = length(X);
  
  Yi = zeros(1, n-2);
  
  for i=1:n-2
    Yi(i) = (Y(i + 2) - Y(i)) / (X(i + 2) - X(i));
  endfor
