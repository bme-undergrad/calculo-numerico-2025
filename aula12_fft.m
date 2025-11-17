clc
clear all
close all

Ts = 1/1000; # s, período de aquisição
fs = 1/Ts; # Hz, frequência de aquisição
Tend = 2; #s
t = 0:Ts:Tend;
N = length(t);

# cálculo da função no tempo com ruído
T0 = 1/3;
f0 = 1/T0;
##f = sin(2*pi*f0*t);
##f = 2.25*sin(2*pi*f0*t+1);
##f = sin(2*pi*f0*t)+rand(1, N)/5;
f = sin(2*pi*f0*t)+0.1*sin(2*pi*10*f0*t)+rand(1, N)/5;

figure(1)
plot(t, f, 'k--') #função original no tempo


# análise na frequência
fft_calc = fft(f); # cálculo da fft
amp_fft = abs(fft_calc/N); # obtenção da amplitude
freq_plot = fs*(0:N-1)/N; # geração do vetor de frequências

#atualização porque o vetor é espelhado
freq_plot = freq_plot(1:floor(N/2));
aux = amp_fft(1);
amp_fft = amp_fft(1:floor(N/2))*2;
amp_fft(1) = aux;
##
figure(2)
hold on
stem(freq_plot, amp_fft) # espectro de frequências
grid on
xlabel('Frequências [Hz]', 'fontsize', 16) # se multiplicar por 2pi, teremos w (omega)
ylabel('Módulo da amplitude [-]', 'fontsize', 16)
set(gca, 'fontsize', 14)
hold off
##
### achando quais frequências estão presentes
limiar = 0.02; # inspeção visual do espectro de amplitudes da fft
idx = find(amp_fft > limiar);
####idx = idx(2:end); # eliminando o primeiro que é do valor cc
##
# reconstruindo o sinal: calculando cada cosseno

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

figure(1)
hold on
plot(t, f_reconstruido, 'r', 'linewidth', 1.2)
grid on
xlabel('Tempo [s]', 'fontsize', 16)
ylabel('f(t) [-]', 'fontsize', 16)
legend('Original', 'Reconstruído')
set(gca, 'fontsize', 14)
hold off
##
##
### take-home messages
### 1) Se tiver um nível CC, vai aparecer em freq = 0;
### 2) Cuidado com o limiar que escolhemos. É uma questão iterativa, analise a fft e depois escolha
### 3) Conseguimos só avaliar frequências até fs/2, ou seja, metade da frequência de aquisição
### 4) O ruído insere diversos harmônicos no nosso sinal.
### 5) A FFT pode nos ajudar a escolher a frequência de corte!
