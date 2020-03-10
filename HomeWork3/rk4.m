function [x,t]=rk4(fun,x0,t0,tk,n,G,m1,m2)
%[x,t]=rk4(fun,x0,t0,tk,n)
%izracuna priblizek x za resitev diferencialne enacbe
%x'(t)=fun(t,x(t))
%x(t0)=x0
%na intervalu [t0,tk] po metodi Runge-Kutta 4.reda.
%n je stevilo korakov
d=length(x0);%dimenzija sistema
t=linspace(t0,tk,n);%cas
h=t(2)-t(1);%korak
x=zeros(d,n);%prostor za resitev
x(:,1)=x0;%zacetni pogoj
  for i=1:n-1
    k1=h*feval(fun,t(i),x(:,i),G,m1,m2);
    k2=h*feval(fun,t(i)+h/2,x(:,i)+k1/2,G,m1,m2);
    k3=h*feval(fun,t(i)+h/2,x(:,i)+k2/2,G,m1,m2);
    k4=h*feval(fun,t(i)+h,x(:,i)+k3,G,m1,m2);
    x(:,i+1)=x(:,i)+(k1+2*k2+2*k3+k4)/6;
  endfor
endfunction