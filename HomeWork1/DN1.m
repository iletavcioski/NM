%r je radius in phi je kot
%to je poljuben primer, lahko bo  sin(phi) ali tan(phi) 
%ali phi^2 ali r^2 phi ali konstanto
f_r1 = @(r, phi) sin(phi); %notrjna kroznica 
f_r2 = @(r, phi) cos(phi); %zunajna kroznica

% f je funkcija ki ce r == 1  to je 1 in r == 2 bo 0
% in je funkcija f_r1 ce je obratno to je funkcija f_r2
f = @(r, phi) (r == 1) * feval(f_r1, r, phi) + (r == 2) * feval(f_r2, r, phi);
%to je poljuben primer
figure (1);
[U, k] = laplaceK(f, 25, 1e-3, 2000, 'jacobi');
figure (2);
[U, k] = laplaceK(f, 25, 1e-3, 2000, 'gs');

