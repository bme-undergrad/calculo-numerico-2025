clc
clear all
close all

# colunas: time,seconds_elapsed,qz,qy,qx,qw,roll,pitch,yaw
data = csvread('Orientation.csv')(2:end, 1:end);

time =  data(1:end, 2)';
roll =  data(1:end, 7)';
pitch = data(1:end, 8)';
yaw =   data(1:end, 9)';

figure(1)
plot(time, roll)
hold on
plot(time, pitch)
plot(time, yaw)
legend('roll', 'pitch', 'yaw')
hold off

idx_init = 2704;
idx_end = 2704+500;
figure(2)
plot(roll(idx_init:idx_end))
hold on
plot(yaw(idx_init:idx_end))
hold off

f = roll(idx_init:idx_end);
Ts = 0.012;
fs = 1/Ts;
N = length(f);

fft_calc = fft(f); # cálculo da fft
amp_fft = abs(fft_calc/N)*2; # obtenção da amplitude
freq_plot = fs*(0:N-1)/N; # geração do vetor de frequências

#atualização porque o vetor é espelhado
freq_plot = freq_plot(1:floor(N/2));
amp_fft = amp_fft(1:floor(N/2));

figure(3)
hold on
plot(freq_plot, amp_fft) # espectro de frequências
grid on
xlabel('Frequências [Hz]', 'fontsize', 16) # se multiplicar por 2pi, teremos w (omega)
ylabel('Módulo da amplitude [-]', 'fontsize', 16)
set(gca, 'fontsize', 14)
hold off

# achando quais frequências estão presentes
limiar = 0.25; # inspeção visual do espectro de amplitudes da fft
idx = find(amp_fft > limiar);
##idx = idx(2:end); # eliminando o primeiro que é do valor cc

# reconstruindo o sinal: calculando cada cosseno
t = time(idx_init:idx_end);
t = t - t(1);
amps_reconstrucao = zeros(1,length(idx));
fase_reconstrucao = zeros(1,length(idx));
f_reconstruido = zeros(1,length(t));

for ii = 1:length(idx)
  amp_reconstrucao(ii) = amp_fft(idx(ii));
  parte_imag = imag(fft_calc(idx(ii)));
  parte_real = real(fft_calc(idx(ii)));
  fase_reconstrucao(ii) = atan2(parte_imag, parte_real);
  f_reconstruido = f_reconstruido + amp_reconstrucao(ii)*cos(2*pi*freq_plot(idx(ii))*t+fase_reconstrucao(ii));
endfor

figure(4)
hold on
plot(t, roll(idx_init:idx_end),'--')
grid on
plot(t, f_reconstruido)
xlabel('Tempo [s]', 'fontsize', 16)
ylabel('f(t) [-]', 'fontsize', 16)
legend('Original', 'Reconstruído')
set(gca, 'fontsize', 14)
hold off
##
### o sinal não é exatamente periódico ne? mas conseguimos ver, pela fft, as frequências predominantes
