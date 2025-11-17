close all
clear all
clc

T0 = pi;
w0 = 2*pi/T0;
Nmax = 50;

t = -2*pi:pi/100:2*pi;
x = exp(-mod(t, T0)/2);

a0 = 0.504;
x_fourier = a0*ones(1,length(t));
Cn_vetor = zeros(1, Nmax);
theta_n_vetor = zeros(1, Nmax);

ii = 1;
for n=1:Nmax
  an = 0.504*(2/(1+16*n^2));
  bn = 0.504*(8*n/(1+16*n^2));
  Cn = sqrt(an^2+bn^2);
  theta_n = atan(-bn/an);
  x_fourier = x_fourier + Cn*cos(n*w0*t+theta_n);

  Cn_vetor(ii) = Cn;
  theta_n_vetor(ii) = theta_n;
  ii = ii+1;
endfor

figure
hold on
plot(t, x_fourier, 'linewidth', 2)
plot(t, x, 'linewidth', 2)
grid on
xlabel('t [s]', 'fontsize', 16)
ylabel('x(t)', 'fontsize', 16)
xlim([-2*pi, 2*pi])
hold off


### espectro
figure
hold on
plot((1:Nmax)*w0, Cn_vetor, 'ko', 'linewidth', 1.2)
stem((1:Nmax)*w0, Cn_vetor, 'Marker', 'none', 'k', 'linewidth', 1.2);
grid on
xlabel('w [rad/s]', 'fontsize', 16)
ylabel('Cn', 'fontsize', 16)
title('Espectro de amplitude', 'fontsize', 16)
hold off
