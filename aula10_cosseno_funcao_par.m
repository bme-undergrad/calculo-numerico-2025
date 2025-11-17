close all
clear all
clc

T0 = pi;
t = -2*pi:pi/100:2*pi;
y = cos(1*2*pi/T0*t);
y2 = sin(1*2*pi/T0*t);
tri = 2 * abs(2 * (mod(t, T0) / T0) - 1) - 1;
##tri = sign(sin(2*t));

subplot(2, 1, 1)
hold on
plot(t, y, 'linewidth', 2)
plot(t, tri, 'linewidth', 2)
grid on
xlabel('t [s]', 'fontsize', 16)
ylabel('x(t)', 'fontsize', 16)
title('cosseno', 'fontsize', 16)
xlim([-2*pi, 2*pi])
hold off

subplot(2, 1, 2)
hold on
plot(t, y2, 'linewidth', 2)
plot(t, tri, 'linewidth', 2)
grid on
xlabel('t [s]', 'fontsize', 16)
ylabel('x(t)', 'fontsize', 16)
title('senos', 'fontsize', 16)
xlim([-2*pi, 2*pi])
hold off

##legend('x(t)', 'sin(2t)', 'fontsize', 14, 'location', 'southwest')

