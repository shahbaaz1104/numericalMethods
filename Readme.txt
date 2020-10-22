# numericalMethods
Matlab code for Numerical Methods - Fixed Point Iterative Method, Mullers Method, Aitken's Method & Chebyshev's Root method

1. Fixed Point Iteration Method
   f (x) = 0 ⇐⇒ x = g(x)
   Function
   fixedPoint(phi,x0,maxiter)
   Inputs 
   where phi = g(x)
         x0 = initial value
         maxiter = maximum number of iterations
   Defaults
   error = 1e-4
   Outputs
   y = value after each iteration
   i = iter value at which error limit was met
   
2. Mullers Method
   Function
   muller(func,input,maxiter)
   Example : muller(@x(x^2 - 6),[2.3,2.4,2.5],5)
   Inputs
   where func = function handler written as in example for mathematical expression
         input = initial conditions, (3 initial conditions)
         maxiter =  maximum number of iterations
   Output
   y = value after each iteration
   
3. Aitkinson's delta squared method
   f (x) = 0 ⇐⇒ x = g(x)
   Function
   aitkensD2(phi,x0,maxiter)
   Inputs
   where phi = g(x)
         x0 = initial value
         maxiter = maximum number of iterations
   Outputs
   y = value after each iteration
   dy = delta y
   ddy = delta squared y
   
4. Chebyshev's Root Method
   xn+1=xn−f(xn)f′(xn)−(f(xn)f′(xn))2f′′(xn)2f′(xn),n=0,1,...
   Function
   chebyshevRoot(func,x0,maxiter)
   Example chebyshevRoot(@(x)(x^2 - 6),2,3)
   Inputs
   where func = function handler written as in example for mathematical expression
         x0 = initial value
         maxiter = maximum number of iterations
   Output
   y = value after each iteration
         
         
         