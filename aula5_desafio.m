clear all
close all
clc
g = 9.81;
y0 = 1.80; # m (altura do atleta)
v0 = 25; # m/s; deve estar entre [20, 30] m/s
theta0 = 45*pi/180; # graus; deve estar entre [30, 50]*pi/180 rad
X_theta = @(theta0)(v0*cos(theta0)/g*(v0*sin(theta0)+sqrt(v0^2*sin(theta0)^2+2*g*y0)));

X_theta(theta0)

theta0_values = deg2rad(30):deg2rad(5):deg2rad(50);
X_values_theta0_cte = zeros(length(theta0_values),1);

for ii = 1:length(X_values_theta0_cte)
  X_values_theta0_cte(ii) = X_theta(theta0_values(ii));
endfor
##
plot(theta0_values,X_values_theta0_cte)
grid on
hold on

X_theta_min = @(theta0)(-v0*cos(theta0)/g*(v0*sin(theta0)+sqrt(v0^2*sin(theta0)^2+2*g*y0)));
theta0_star = fminbnd(X_theta_min, deg2rad(30), deg2rad(50));
printf('theta0_otimo = %d\n', theta0_star*180/pi)
printf('X_max_otimo = %d\n', X_theta(theta0_star))
plot(theta0_star, X_theta(theta0_star), 'ro')
hold off


figure
y = @(x)(tan(theta0_star)*x-g/(2*v0^2*cos(theta0_star)^2)*x^2+y0);
x_test = 0:0.1:120;
y_values = zeros(length(x_test),1);
for ii = 1:length(x_test)
  y_values(ii) = y(x_test(ii));
endfor

plot(x_test, y_values)
