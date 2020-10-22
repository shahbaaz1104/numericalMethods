function [y] = muller(func,input,maxiter)
y=zeros(1,maxiter+1);
x = input;
f = zeros(1,3);
for m = 1:maxiter+1
for i=1:2
    for j=1:2
        if x(i)>x(i+1)
            x(i)=x(i)+x(i+1);
            x(i+1) = x(i)-x(i+1);
            x(i)=x(i)-x(i+1);
        end
    end
end

for i=1:3
    %f(i) = x(i)^3 - 13*x(i) - 12; % Change ur function here\
    f(i)=func(x(i));
end
c = f(3);
h = [x(2)-x(1),x(3)-x(2)];
del = [(f(2)-f(1))/h(1),(f(3)-f(2))/h(2)];
a = (del(2)-del(1))/(h(2) + h(1));
b = a*h(2) + del(2);
X1 = x(3) - ((2*c)/(b+(b^2 - 4*a*c)^(0.5)));
X2 = x(3) - ((2*c)/(b-(b^2 - 4*a*c)^(0.5)));
%if abs(X1^3 - 13*X1 - 12) < abs(X2^3 - 13*X2 - 12) % Change your function here also
if abs(func(X1)) < abs(func(X2))
    if X1>=x(1) && X1<=x(2)
        x(3)=x(2);
        x(2)=X1;
    elseif X1>=x(2) && X1<=x(3)
        x(1)=x(2);
        x(2)=X1;
    elseif X1<=x(1)
        x(3)=x(2);
        x(2)=x(1);
        x(1)=X1;
    elseif X1>=x(3)
            x(1)=x(2);
            x(2)=x(3);
            x(3)=X1;
    end
else
    X1 = X2;
    if X1>=x(1) && X1<=x(2)
        x(3)=x(2);
        x(2)=X1;
    elseif X1>=x(2) && X1<=x(3)
        x(1)=x(2);
        x(2)=X1;
    elseif X1<=x(1)
        x(3)=x(2);
        x(2)=x(1);
        x(1)=X1;
    elseif X1>=x(3)
            x(1)=x(2);
            x(2)=x(3);
            x(3)=X1;
    end
end 
y(m)=X1;
end
y = y(2:maxiter+1);
end

