%resiteve (p1(t),q1(t)) == (p2(s),q2(s)) za 0 < s,t < 1
%p1p,p2p,q2p,q1p so parametre p1,p2,q2,q1 respectivly
% parametre p1p,q1p,p2p,q2p mora da so transponirani
p1p = [-2.54107;3.38576;0.50243;-0.14608];
q1p = [0.086691;-0.320360;-0.823619;0.793783];
p2p = [-2.23472;3.77793;-0.50243;-0.84459];
q2p = [-3.96909; 6.14395; 0.82362; -1.61475];
l = linspace(0, 1);
clf;
hold on;
plot(polyval(p1p, l), polyval(q1p, l));%narisi krivulje
plot(polyval(p2p, l), polyval(q2p, l));
%funkcije polinome 3. stopnje
p1 = @(x) ([x^3 x^2 x 1]*p1p);
p2 = @(x) ([x^3 x^2 x 1]*p2p);
q1 = @(x) ([x^3 x^2 x 1]*q1p);
q2 = @(x) ([x^3 x^2 x 1]*q2p);
%odvod za tiste polinome
dp1 = @(x) ([3*x^2 2*x 1 0]*p1p);
dp2 = @(x) ([3*x^2 2*x 1 0]*p2p);
dq1 = @(x) ([3*x^2 2*x 1 0]*q1p);
dq2 = @(x) ([3*x^2 2*x 1 0]*q2p);
[t, s, it] = newton(p1, dp1, p2, dp2, q1, dq1, q2, dq2, 0.4, 0.6, 1e-11, 2000);
printf("t je\n");
t
printf("s je\n");
s
printf("stevilo iteracij je\n");
it
printf("Natancnost je\n");
p1(t) - p2(s)
q1(t) - q2(s)

