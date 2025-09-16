clear all
close all
clc
% 1 par (v0, theta0)

g = 9.81;
y0 = 1.80; # m (altura do atleta)
v0 = 25; # m/s
theta0 = 30*pi/180; # graus
y = @(x)(tan(theta0)*x-g/(2*v0^2*cos(theta0)^2)*x^2+y0);

x_test = 0:0.1:150;
y_values = zeros(length(x_test),1);
for ii = 1:length(x_test)
  y_values(ii) = y(x_test(ii));
endfor

plot(x_test, y_values)
ylim([0, 30])
xlim([0, 120])
grid on
xlabel('x [m]')
ylabel('y [m]')

%%%%%%%%%%%%%%%%%%%%%%%%%%

% análise de sensitividade da função objetivo em theta0

figure
hold on

for theta0_i = 30:40
  g = 9.81;
  y0 = 1.80; # m (altura do atleta)
  v0 = 25; # m/s
  theta0 = theta0_i*pi/180; # graus
  y = @(x)(tan(theta0)*x-g/(2*v0^2*cos(theta0)^2)*x^2+y0);

  x_test = 0:0.1:150;
  y_values = zeros(length(x_test),1);
  for ii = 1:length(x_test)
    y_values(ii) = y(x_test(ii));
  endfor

  plot(x_test, y_values)
  title('Alterando theta0')
endfor

ylim([0, 30])
xlim([0, 120])
grid on
xlabel('x [m]')
ylabel('y [m]')
hold off

%%%%%%%%%%%%%%%%%%%%%%%%%%

% análise de sensitividade da função objetivo em v0

figure
hold on

for v0_i = 20:30
  g = 9.81;
  y0 = 1.80; # m (altura do atleta)
  v0 = v0_i; # m/s
  theta0 = 40*pi/180; # graus
  y = @(x)(tan(theta0)*x-g/(2*v0^2*cos(theta0)^2)*x^2+y0);

  x_test = 0:0.1:150;
  y_values = zeros(length(x_test),1);
  for ii = 1:length(x_test)
    y_values(ii) = y(x_test(ii));
  endfor

  plot(x_test, y_values)
  title('Alterando v0')
endfor

ylim([0, 30])
xlim([0, 120])
grid on
xlabel('x [m]')
ylabel('y [m]')
hold off
