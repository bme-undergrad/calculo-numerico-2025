clc
clear all
x_plt = 1:0.01:10;

x = 1:10;
y = [0.0099688
    0.029175
    0.069771
    0.11515
    0.33414
    0.43616
    0.51482
    0.5313
    0.72291
    0.78563];

a_9 = polyfit(x, y, 9);
p_9 = a_9(1)*x_plt.^9+a_9(2)*x_plt.^8+a_9(3)*x_plt.^7+a_9(4)*x_plt.^6+a_9(5)*x_plt.^5+a_9(6)*x_plt.^4+a_9(7)*x_plt.^3+a_9(8)*x_plt.^2+a_9(9)*x_plt+a_9(10);

a_3 = polyfit(x, y, 3);
p_3 = a_3(1)*x_plt.^3+a_3(2)*x_plt.^2+a_3(3)*x_plt+a_3(4);

plot(x, y, 'ko')
hold on
plot(x_plt, p_9)
plot(x_plt, p_3)
grid on
hold off
