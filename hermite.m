function [DD,f] = hermite(xin,yin,dy)
format long

n = length(xin);
x = zeros(1,2*n);
y = zeros(1,2*n);
j=1;
for i=1:n
    x(j)=xin(i);
    x(j+1)=x(j);
    
    y(j)=yin(i);
    y(j+1)=y(j);
    
    j=j+2;
end

n = length(x);
DD = zeros(n,n);
Y = y;

i=1;
j=1;
while(i<=n)
    DD(i,1)=dy(j);
    i=i+2;
    j=j+1;
end

delta=1;
for i=1:n-1
    X = zeros(1,length(x)-delta);
    for m =1:length(x)-delta
        X(m) = x(m+delta)-x(m);
    end
   
    for j=1:length(x)-delta
        if X(j)~=0
        DD(j,i) = (Y(j+1)-Y(j))/(X(j));
        end
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
        temp = x(j);
        temp = round(temp,4);
        M = M*(t-temp);
    end
    M = M*round(DD(1,step),4);
    
    f = f + M;
    step = step+1;
end    

end

