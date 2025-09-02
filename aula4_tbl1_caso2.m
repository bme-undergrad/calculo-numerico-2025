close all
clc
clear all
q = 0.333;    % kN/cm
E = 10000;    % kN/cm^2; 10 GPa (osso)
I = 0.0016;   % cm^4
L = 3;        % cm

y = @(x)(q/(120*E*I*L)*(-x^5+2*L^2*x^3-L^4*x))
yd = @(x)(q/(120*E*I*L)*(-5*x^4+6*L^2*x^2-L^4))
ydd = @(x)(q/(120*E*I*L)*(-20*x^3+12*L^2*x))


x = 0:0.01:L;
y_val = zeros(length(x),1);
yd_val = zeros(length(x),1);
ydd_val = zeros(length(x),1);

for ii = 1:length(x)
  y_val(ii) = y(x(ii));
  yd_val(ii) = yd(x(ii));
  ydd_val(ii) = ydd(x(ii));
endfor

plot(x, y_val)
hold on
plot(x, yd_val)
plot(x, ydd_val)
grid on
hold off

x_max = zeros(5,1);
x_max(1) = 2;

for ii = 1:length(x_max)-1
  x_max(ii+1) = x_max(ii) - yd(x_max(ii))/ydd(x_max(ii));
  x_max(ii)
endfor

y(x_max(end))

##fminbnd(y, 0, L);
