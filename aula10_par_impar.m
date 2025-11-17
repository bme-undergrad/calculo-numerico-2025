close all
clear all
clc

m = 2;
t = 0:pi/100:pi;
y = cos(m*t);

y2 = sin(m*t);

plot(t, y, 'linewidth', 2)
hold on
grid on
plot(t, y2, 'linewidth', 2)
xlabel('t [s]', 'fontsize', 16)
ylabel('y(t)', 'fontsize', 16)
title('m = 2', 'fontsize', 16)
xlim([0, pi])
hold off

legend('cos(mt)', 'sen(mt)', 'fontsize', 14, 'location', 'southwest')
legend('cos(mt)', 'sen(mt)', 'fontsize', 14, 'location', 'southwest')

