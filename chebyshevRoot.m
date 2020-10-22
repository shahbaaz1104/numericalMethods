function [y] = chebyshevRoot(func,x0,maxiter)
y=zeros(1,maxiter+1);
y(1)=x0;
syms x
df = eval(['@(x)' char(diff(func(x)))]);
dff = eval(['@(x)' char(diff(df(x)))]);

%df = matlabFunction(diff(func));
%dff = matlabFunction(diff(df));

for i=2:maxiter+1
    y(i) = y(i-1) - func(y(i-1))/df(y(i-1)) - 0.5*(dff(y(i-1))/df(y(i-1)))*(func(y(i-1))/df(y(i-1)))^2;
end

end

