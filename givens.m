function [] = givens(A)

while 1
theta = atan(A(1,3)/A(1,2));
theta_deg = radtodeg(theta);

S = [1 0 0; 0 cos(theta) -sin(theta); 0 sin(theta) cos(theta)];
B = S'*A*S;
theta_deg
B
prompt = " Enter strum to proceed further , exit to quit and any thing else to repeat \n";
type = input(prompt,'s');
type = upper(type);
if type == "STRUM"
    break;
elseif type == "EXIT"
    return
else
    A = B;
end

end

syms L

b = B;
b = b'*(-1);
%{
for i=1:3
    for j=1:3
        b(i,j) = round(b(i,j),4);
    end
end
%}
f0 = 1;
f1 = b(1,1) + L;
f2 = f1*(b(2,2) + L) - b(1,2)*b(2,1);
f3 = (b(3,3) + L)*f2 + (b(3,2)^2)*f1;
tol = 1e-4;    
b(b<0 & b>-tol) = 0;
b(b>0 & b<tol) = 0;
f3 = (b(3,3) + L)*f2 - ((b(2,3))^2)*f1;
f0
f1
f2
f3

[eigenval] = solve(f3);
fprintf(" Eigen values are \n");
eigenval

end

