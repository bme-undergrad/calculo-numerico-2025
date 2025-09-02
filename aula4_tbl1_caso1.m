close all
clc
clear all

g =  @(c)((2*c)/(4+0.8*c+c^2+0.2*c^3));
g_negativo =  @(c)((-2*c)/(4+0.8*c+c^2+0.2*c^3));
gd = @(c)((-20*c^3-50*c^2+200)/(20+4*c+5*c^2+c^3)^2);
gdd = @(c)(20*(3*c^5+15*c^4+21*c^3-120*c^2-300*c-80)/(20+4*c+5*c^2+c^3)^3);

c = 0:0.01:10;
g_val = zeros(length(c),1);
g_minus = zeros(length(c),1);
gd_val = zeros(length(c),1);
gdd_val = zeros(length(c),1);

for ii = 1:length(c)
  g_val(ii) = g(c(ii));
  g_minus(ii) = g_negativo(c(ii));
  gd_val(ii) = gd(c(ii));
  gdd_val(ii) = gdd(c(ii));
endfor

plot(c, g_val)
hold on
plot(c, gd_val)
plot(c, gdd_val)
plot(c, g_minus)
grid on
legend('g', 'gd', 'gdd', '-g')
hold off

c_max = zeros(5,1);
c_max(1) = 1.5;

for ii = 1:length(c_max)-1
  c_max(ii+1) = c_max(ii) - gd(c_max(ii))/gdd(c_max(ii));
  c_max(ii)
endfor

printf("c_max ")
c_max(end)
printf("g_max ")
g(c_max(end))

g_minus =  @(c)((-2*c)/(4+0.8*c+c^2+0.2*c^3));
printf("fminbnd ")
fminbnd(g_minus, 0, c(end))
