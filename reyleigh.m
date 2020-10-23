function [L,X] = reyleigh(A,x,maxiter)
n = length(x);
x= x.';
L = zeros(1,maxiter+1);
X = x;
X = repmat(X,[1,maxiter+1]);
Big = X;
L(1)=1;

for i=2:maxiter+1
    Big(:,i) = A*X(:,i-1);
    f = Big(1,i);
    
    for j=1:n
        if f < abs(Big(j,i))
            f = abs(Big(j,i));
        end
    end
   
    L(i)=f;
    for j=1:n
        Big(j,i) = Big(j,i)/L(i);
    end
    X(:,i)=Big(:,i);
end

end

