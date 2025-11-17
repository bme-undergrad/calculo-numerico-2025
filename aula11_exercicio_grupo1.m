clf
clear all
clc

f = @(x)(1-exp(-x));

x = [0, 2.5, 5];
y = [f(x(1)), f(x(2)), f(x(3))]

a = polyfit(x, y, 2);
f2 = @(x)(a(1)*x.^2+a(2)*x+a(3))

x_plot = 0:0.01:6;
plot(x_plot, f(x_plot), 'k--')
hold on
grid on
plot(x, y, 'ro')

plot(x_plot, f2(x_plot))
ylim([0, 1])

hold off
