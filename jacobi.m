function [] = jacobi(A,tol,type,maxiter)
[r,c] = size(A);
if nargin<3
    type = "AUTO";
    maxiter = 10;
elseif nargin<4
    type = upper(type);
    if type=="AUTO"
        maxiter = 10;
    end
end
type = upper(type);

%format short
if  (r ~= c)
    disp(" Matrix not symmetrix");
    return
end

D = ones(r,r);

gi = 1;
gj= 1;
B = zeros(r,r);
B_prev = eye(r);
count = 0;
iter = 1;
while (~isdiag(D) && iter<=maxiter)
    
    gama = 0;
    B = zeros(r,r);
for i=1:r
    for j=1:r
     if i~=j
         if abs(A(i,j))>gama
             gama = abs(A(i,j));
             gi =i;
             gj=j;
         end
     end
    end
end

alpha = A(gi,gi);
beta = A(gj,gj);
theta = atan(gama/(alpha - beta))/2;
theta_deg = radtodeg(theta);

    for m=1:r
        for n=1:r
            if m==n
            B(m,n)=1;
            end
        end
    end
    B(gi,gi) = cos(theta);
    B(gj,gj) = cos(theta);
    B(gi,gj) = -sin(theta);
    B(gj,gi) = sin(theta);
    D = B'*A*B;
    D(D<0 & D>-tol) = 0;
    D(D>0 & D<tol) = 0;
    if ~isdiag(D)
        A = D;
    end
    B_prev = B_prev*B;
    fprintf("\n theta degrees %d",count);
    theta_deg
    fprintf("\n theta radians %d",count);
    theta
    fprintf("\n B %d",count);
    B
    fprintf("\n D %d",count);
    D
    fprintf("\n eigen vectors %d",count);
    if count>=1
    B_prev
    else
    B
    end
    count = count+1;
    if type=="MANUAL"
        iter = iter+1;
    end
end

end

