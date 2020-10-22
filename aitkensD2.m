function [y,dy,ddy] = aitkensD2(phi,x0,maxiter)
format long;
x = zeros(1,maxiter);
delx = zeros(1,maxiter-1);
del2x = zeros(1,maxiter-2);
x(1) = x0;
for i=2:3
    x(i)=phi(x(i-1)); %TYPE UR PHI(X) HERE
    delx(i-1) = x(i)-x(i-1);
end
del2x(1) = delx(2) - delx(1);
for i=4:maxiter
    x(i) = x(i-1) - ((delx(i-2)^2)/del2x(i-3));
    delx(i-1) = x(i) - x(i-1);
    del2x(i-2) = delx(i-1) - delx(i-2);
end

y = x;
dy = delx;
ddy= del2x;


end

