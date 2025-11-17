close all
clear all
clc

hold on
t = 0:pi/100:2*pi;
for m = 1:3
  y = cos(m*t);
  plot(t, y, 'linewidth', 2)
endfor

grid on
xlabel('t [s]', 'fontsize', 16)
ylabel('y(t)', 'fontsize', 16)
title('cossenos', 'fontsize', 16)
xlim([0, 2*pi])
hold off

legend('cos(1t)', 'cos(2t)', 'cos(4t)', 'fontsize', 14, 'location', 'southwest')

