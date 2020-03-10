function dx = gibanje(t,x,G,m1,m2)
  p1 = [x(1,1);x(2,1)];
  p2 = [x(3,1);x(4,1)];
  vp1 = [x(5,1);x(6,1)];
  vp2 = [x(7,1);x(8,1)];
  %funkcija ki vraca izvod ob gibanje ob casa
  %izvod ob position ob casa je hitrostijo
  %izvodob hitrost ob casa je acceleration, in this case gravitational
  %acceleration m1g = (Gm1m2/norm(r)^2)*(r/norm(r)) we cancel m1 and we get
  %g = -(Gm2/norm(r)^2)*(r/norm(r))
  %so our vector will be
  %r/norm(r) je vector direction which is decided if we see from first to second planet or otherwise
  
  r1 = p1 - p2;
  r2 = p2 - p1;
  dx = [vp1;vp2;((G*m2)/(norm(r1)^2))*(r2/norm(r2));((G*m1)/(norm(r2)^2))*(r1/norm(r1))];
endfunction
