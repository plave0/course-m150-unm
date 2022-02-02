function n = notnum1(v)
  
  N = v(find(mod(v,2) == 1));
  Nl = length(N);
  n = sum(N .* 10 .^ fliplr(0:Nl-1));
  
  p = 1;
  for i=1:floor(Nl/2)
    if N(i) ~= N(Nl-i+1)
      p = 0;
      break;
    endif
  endfor
  
  if p==1
    disp('Broj n jeste palindrom');
  else
    disp('Broj n nije palindrom');
  endif
