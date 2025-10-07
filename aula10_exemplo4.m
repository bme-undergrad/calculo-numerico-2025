close all
clear all
clc

x1 = [0, 2, 2.5, 1, 4, 7];
x2 = [0, 1, 2.0, 3, 6, 2];
y = [5, 10, 9, 0, 3, 27];

n = length(y);

A = [      n,     sum(x1),     sum(x2);
     sum(x1),  sum(x1.^2), sum(x1.*x2);
     sum(x2), sum(x1.*x2), sum(x2.^2)];

b = [sum(y);
     sum(x1.*y);
     sum(x2.*y)];

a = A \ b;

plot3(x1, x2, y, 'o')
grid on
xlabel('X1')
ylabel('X2')
zlabel('Y')

figure
plot(x1, x2, 'o')
grid on
xlabel('X1')
ylabel('X2')

z_plano = a(1) + a(2)*x1 + a(3)*x2

# para plotar: https://octave.sourceforge.io/octave/function/meshgrid.html
