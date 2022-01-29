function S = notnum(a,k)
  
  if k < a
    seg = k:a;
    S = prod(seg(find(seg < (k+a)/2)));
  elseif k >= a
    S = ones(1,k);
    S = S .* (a.^(1:k));
    p = ones(1, k);
    p(1) = a;
    for i=2:k
      S = [S; S(i-1,:).*p];
      p(i) = a;
    endfor
  endif
