function [I,Y,x] = nula(x0, xF, tol, iterM)
  
  tablica;
  h = X(2) - X(1);
  
  Pn = Njutn1();
  f = @(x) polyval(Pn, (x - X(1))/h);
 
  x = 0;
  Y = [x0];
  I = [1];
  i = 1;
  while 1
    x1 = x0 - f(x0)/(f(xF) - f(x0)) * (xF - x0);
    Y = [Y x1];
    i = i + 1;
    I = [I i];
    if abs(x1 - x0) < tol
      x = x1;
      disp('Zadovoljena je tacnost');
      break;
    elseif i >= iterM
      disp('Dostignut je maksimalni broj iteracija');
      break;
    endif
    x0 = x1;
  endwhile
