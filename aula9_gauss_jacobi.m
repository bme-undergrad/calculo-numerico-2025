clear all
clc

# Gauss-Jacobi
A = [23000, -9000, 0;
    -9000, 18000, -9000;
    0, -9000, 9000];

b = [490.5; 343.35; 147.15];

C = [0.0000, 0.3913, 0.0000;
     0.5000, 0.0000, 0.5000;
     0.0000, 1.0000, 0.0000];

d = [490.5/23000;
     343.35/18000;
     147.15/9000];

x_ant = [0;
         0;
         0];
ii = 0;
while 1
  ii = ii + 1;
  printf('Iteração %d\n', ii)
  x = C*x_ant+d
##  ea = (norm(x) - norm(x_ant))/norm(x)
##  if abs(ea) < 0.1/100
##    break;
##  endif

  delta = norm(A*x - b)/norm(b)
  if delta < 3e-5
    break;
  endif
  x_ant = x;
endwhile

