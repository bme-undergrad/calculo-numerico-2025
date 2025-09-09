
g = 9.81;
z0 = 100;
m = 80;
c = 15;
v0 = 55;
z = @(t)(100 + m/c*(v0+m*g/c)*(1-exp(-(c/m)*t))-m*g/c*t);

t = 0:0.01:10;
z_values = zeros(length(z),1);

for ii = 1:length(t)
  z_values(ii) = z(t(ii));
endfor

plot(t,z_values)
grid on
z_min = @(t)(100 + m/c*(v0+m*g/c)*(1-exp(-(c/m)*t))-m*g/c*t)*(-1);
t_star = fminbnd(z_min, 0, 10)
z(t_star)
hold on
plot(t_star, z(t_star), 'ro')
hold off
