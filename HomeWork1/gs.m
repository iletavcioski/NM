%funkcija ki bo vracala resitve matriko U in stevilo iteracije, ce rabimo
%gauss-siedlovi iteracija
%tol je dovljena napaka, maxk je dovljena stevila iteraciji, Uk je laplacova matrika

function [U, k] = gs(Uk, tol, maxk)
  U = Uk;
  [n, m] = size(Uk);%n je dimenzija za radij, m je dimenzija za kot
  k = 0;%stevec iteracije
  napaka = 2 * tol;%napaka
  h_r = (1.00) / (n - 1);%h za resitve diferencijalne enacbe za odvod po radius
  h_k = (1.00) / (m - 1);%isto kot h_r ali z odvod po kot
  rad = linspace(1, 2, n);%dolzina radij
  while k < maxk && napaka > tol
    napaka = 0;
    for i = 2 : n - 1
      for j = 1 : m
        jp = j + 1;
        jm = j - 1;
        if j == m%ce j = m, j + 1 je 1 ce je kroznico
          jp = 2;%kjer kot(1) == kot(m)
        endif
        if j == 1%ce j = 1, j - 1 je m ce je kroznico
          jm = m - 1;%kjer kot(1) == kot(m)
        endif
        U(i, j) = ((U(i + 1, j) * (h_k^2 *(rad(i)*h_r + rad(i)^2))) + (U(i - 1, j) *(rad(i)^2*h_k^2))
        + ((U(i,jp) + U(i,jm))*(h_r*h_r)))/((rad(i) * h_r * h_k^2) + (2*rad(i)^2*h_k^2) + (2*h_r^2));
        napaka = max(napaka, abs(Uk(i, j) - U(i, j)));%izracunamo napako
      endfor
    endfor
    
    k = k + 1;%premknemo stevec
    Uk = U;%povozimo star priblizek
  endwhile
endfunction
