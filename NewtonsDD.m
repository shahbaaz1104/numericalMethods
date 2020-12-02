function [DD,f,fsimp] = NewtonsDD(x,y)
n = length(x);
DD = zeros(n,n);
Y = y;

delta=1;
for i=1:n-1
    X = zeros(1,length(x)-delta);
    for m =1:length(x)-delta
        X(m) = x(m+delta)-x(m);
    end
   
    for j=1:length(x)-delta
        DD(j,i) = (Y(j+1)-Y(j))/(X(j));
    end
    
    delta = delta+1;
    
    Y = DD(:,i);    
end

step = 1;
syms t
f = y(1);
M = 1;
for i=1:n
    M = 1;
    for j=1:step
        M = M*(t-x(j));
    end
    M = M*DD(1,step);
    f = f + M;
    step = step+1;
end    
fsimp = simplify(f);
end
