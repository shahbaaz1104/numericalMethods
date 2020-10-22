function [y,iter] = fixedPoint(phi,x0,maxiter)
x = x0;
error = 1e-4;
xold = x0;
for i=1:maxiter
    iter = i;
    x = phi(x); % type ur phi(x) here
    if (abs(x-xold) <= error)
        
        break;
    else
        xold = x;
    end
    y(i)=x;
end
    
end

