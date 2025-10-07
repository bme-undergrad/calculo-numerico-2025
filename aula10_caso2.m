close all
clear all
clc

g = 9.81;
m = 68.1;
c = 12.5;

ti = 1:15;
vi = [10, 16.3, 23, 27.5, 31, 35.6,  39, 41.5, 42.9, 45, 46, 45.5, 46, 49, 50];

v_modelo1 = g*m/c*(1-exp(-c/m*ti));

v_modelo2 = g*m/c*(ti./(3.75+ti));

St = sum( (vi - mean(vi)).^2 );

Sr_modelo1 = sum( (vi - v_modelo1).^2 );
r2_modelo1 = 1 - Sr_modelo1/St

Sr_modelo2 = sum( (vi - v_modelo2).^2 );
r2_modelo2 = 1 - Sr_modelo2/St

### criar modelos polinomiais

p = polyfit(ti, vi, 3);
v_modelo3 = p(1)*ti.^3+p(2)*ti.^2+p(3)*ti+p(4);

plot(ti,vi,'ko')
grid on
hold on
plot(ti, v_modelo1, 'b')
plot(ti, v_modelo2, 'r')
plot(ti, v_modelo3, 'k--')
legend('medido', 'modelo 1', 'modelo 2', 'modelo 3')
hold off

Sr_modelo3 = sum( (vi - v_modelo3).^2 );
r2_modelo3 = 1 - Sr_modelo3/St
