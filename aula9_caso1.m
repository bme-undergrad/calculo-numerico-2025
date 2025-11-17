clear all
close all
clc

pkg load control

I = 0.0264;
b = 0.12;
PL_sobre_2 = 1.69

G = tf(1, [I, b, PL_sobre_2])

polos = pole(G)

if all(real(polos) < 0)
  disp('SIM, o sistema é estável.')
else
  disp('NÃO, o sistema não é estável.')
endif


# discretizando
T = 0.05;
Gd = c2d(G, T)

polos_d = pole(Gd)

norma_polos_d = [norm(polos_d(1)), norm(polos_d(2))]

if all(norma_polos_d < 1)
  disp('SIM, o sistema discreto com 50 ms é estável.')
else
  disp('NÃO, o sistema discreto com 50 ms não é estável.')
endif

### controlador
Kp = 1;

G_controle = tf(Kp, [[I, b, PL_sobre_2+Kp]])

disp('Kp funciona como uma mola ativa, já que insere torque do motor no termo independente.')

disp('Para achar quais valores ele é estável, precisamos achar os polos de Is^2+bs+(PL/2+Kp) = 0.')
disp('Aí precisamos forçar os polos terem sua parte real negativa. Isolando Kp, achamos seu intervalo.')

# Is^2+bs+(PL/2+Kp) = 0 -> s_p = (-b +- sqrt(b^2-4*I*(PL/2+Kp)))/(2I) < 0 ->
# -> -b +- sqrt(b^2-4*I*(PL/2+Kp)) < 0 -> +- sqrt(b^2-4*I*(PL/2+Kp)) < b ->
# -> b^2-4*I*(PL/2+Kp) < b^2 -> -4*I*(PL/2+Kp) < 0 -> (PL/2+Kp) < 0 ->
# -> Kp > -PL/2

disp('No nosso caso, Kp > -PL/2, i.e., Kp > -0.16.')
disp('Na prática, Kp nunca pode ser negativo ou nulo.')
disp('Assim, qualquer Kp deixa o sistema estável PARA ESSE SISTEMA. Mudando I ou B, muda tudo.')

disp('')
disp('')
disp('Para achar quais Kp deixam o sistema estável, devemos discretizar a EDO, achar a FT discreta e achar seus polos.')

