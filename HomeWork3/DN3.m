n = 1e2;%stevilo iteraciji, delimo casa na n parts
m1 = 4.5*10^8;%masa prvega planet 
m2 =  2.3;%masa drugega planet
G = 6.67*10^-11;%gravitaciona konstanta
p1 = [3;17];%zacetna pozicija prvoga planet
p2 = [-6;10];%zacetna pozicija drugega planet
vp1 = [0;0];%zacetna hitrostjo prvega planet
vp2 = [-1.2;2.1];%zacetna hitrostoj drugega planet
%hitrostijo ima dve komponente kjer gibanje planet je krozno gibanje,
%ampak krozno gibanje lahko predstavimo kot gibanje v dve dimenzije,
%eno v x in drugo vo y osi
x0 = [p1;p2;vp1;vp2];
%x0 -> zacetna pozicija kdaj t = 0
[x, t] = rk4('gibanje', x0, 0, 200, n, G, m1, m2);
clf;
hold on;
%narisi gibanje prvega

plot(x(1,:), x(2,:),'rx');
%narisi gibanje drugega
plot(x(3,:), x(4,:),'b');
%imamo resitve za x za vsak t
%in zdaj preverime jel ploscina na hitrostjo je enaka z casa
%so we take a small parts of time and see if the motion is equal for all partsof time
maxploscina = -1e8;
minploscina = 1e8;
ploscina = [];
%gledamo ploscina gibanja drugega planet prema prvega kjer drugega je 
%mnogo manjsa od prvega torej prvega bomo gibala vecje nego prvega
for i = 1:n-1
  P1 = [x(1,i);x(2,i)];
  P2t = [x(3,i);x(4,i)];
  P2t1 = [x(3,i+1);x(4,i+1)];
  %ploscina hitrostjo je (r1xr2)/2
  r1 = P2t - P1;
  r2 = P2t1 - P1;
  minploscina = min(minploscina,abs(((r1(1)*r2(2)) - (r1(2)*r2(1)))/2));
  maxploscina = max(maxploscina,abs(((r1(1)*r2(2)) - (r1(2)*r2(1)))/2)); 
  ploscina = [ploscina; abs(((r1(1)*r2(2)) - (r1(2)*r2(1)))/2)];
endfor
printf("Ploscina hitrostjo drugega planet glede na prvega je: \n");
ploscina
printf("Razlika najvecja plscina in najmansja ploscina je: \n");
maxploscina - minploscina

