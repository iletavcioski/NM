%izracuna resitve (p1(t),q1(t)) == (p2(s),q2(s)) z pomocjo newtnovo metodo
%tol je dovoljena napaka
%maxit je maksimalno stevilo iteracij
%[t0,s0] zaceten priblizek
%p1 polinom prve enacbe p1
%q1 polinom prve enacbe q1
%p2 polinom druge enacbe p2
%q2 polinom druge enacbe q2
%dp1 parcijalni odvod prve enacbe p1
%dp2 parcijalni odvod druge enacbe p2
%dq1 parcijalne odvod prve enacbe q1
%dq2 parcijalni odvod druge enacbe q2
function [t, s, it] = newton(p1, dp1, p2, dp2, q1, dq1, q2, dq2, t0, s0, tol, maxit)
  R = [t0;s0];%transponirani
  %R vesbuje resitve t, s, zacetni priblizek
  napaka = 2 * tol;%zacetna napaka
  it = 0;%zacetno stevilo iteracij
  while it < maxit && napaka > tol%iteracij dokler ne dosezemo maxit ali napaka je vecja od tol
    t = R(1); %
    s = R(2);%priblizek
    J = [dp1(t) -dp2(s); dq1(t) -dq2(s);];%jacobieva matrica parcijalni odvodov
    B = [p1(t) - p2(s); q1(t) - q2(s);];%this is matrix of length between r1(t) and r2(s) because in fact
    %this newton's method doesnt find zeroes but like in that that find zeroes 
    %we can imagine as the one function is the x axis and we try to (priblizi)
    NR = R - (J\B);%bistveni korak newtnove iteracij
    napaka = norm(abs(NR - R));%za napako uzamemo zaporedne priblizkama
    R = NR;
    it = it + 1;
  endwhile
endfunction
