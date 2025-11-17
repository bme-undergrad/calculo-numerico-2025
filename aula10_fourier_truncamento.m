close all
clear all
clc

T0 = pi;
t = -2*pi:pi/100:2*pi;
x = exp(-mod(t, T0)/2);

a0 = 0.504;
x_fourier = a0*ones(1,length(t));

w0 = 2*pi/T0;
for n=1:50
  an = 0.504*(2/(1+16*n^2));
  bn = 0.504*(8*n/(1+16*n^2));
  x_fourier = x_fourier + an*cos(n*w0*t) + bn*sin(n*w0*t);
endfor


hold on
plot(t, x_fourier, 'linewidth', 2)
plot(t, x, 'linewidth', 2)
grid on
xlabel('t [s]', 'fontsize', 16)
ylabel('x(t)', 'fontsize', 16)
title('cosseno', 'fontsize', 16)
xlim([-2*pi, 2*pi])
ylim([0, 1.1])
hold off

##legend('x(t)', 'sin(2t)', 'fontsize', 14, 'location', 'southwest')

