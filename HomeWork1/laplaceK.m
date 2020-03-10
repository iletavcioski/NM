function [U, k] = laplaceK(f, n, tol, maxit, metoda)
  kot = linspace(0, 2*pi, n);%delimo kroznico na n delov, po koti
  radius = linspace(1, 2, n + 2);%delimo radius na n + 2 delov kjer
  %r == 1 in r == 2 je vec definiran
  U = zeros(n + 2, n); %matrika U dimenzije (n + 2) x n,
  %ena dimenzija za radius in druga za kot
  for i = 1 : n
    U(1, i) = feval(f, 1, kot(i));
    U(n + 2, i) = feval(f, 2, kot(i));
  endfor
  tic;
  switch metoda
    case 'jacobi'
      [U, k] = jacobi(U, tol, maxit);
      printf("Stevilo iteracije  za jacobi metodo je = %d\n", k);
    case 'gs'
      [U, k] = gs(U, tol, maxit);
      printf("Stevilo iteracije  za gauss-siedlovo metodo je = %d\n", k);
  endswitch
  toc;
  %crtanje na matriko U, resitev laplacobo enacbo (delta)u = 0
  x = radius' * cos(kot);
  y = radius' * sin(kot);
  surf(x, y, U);
endfunction
