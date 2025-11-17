clc
clear all

R1 = 8;
R2 = 12;
R3 = 10;
V = 80;

Pra = @(Ra)(((Ra*R3*V)/(R1*(R3+R2+Ra)+R3*(R2+Ra)))^2/Ra);

Ra_valores = 0.1:0.2:50;
P_valores = zeros(length(Ra_valores),1);

for ii = 1:length(Ra_valores)
  P_valores(ii) = Pra(Ra_valores(ii));
endfor

plot(Ra_valores,P_valores)
grid on
xlabel('Ra')
ylabel('Pra')


% aplicando o método de Newton
Ra = 5;
delta = 1e-5;

n_max = 100;


for ii = 1:n_max
    Ra = Ra - Ra*delta*Pra(Ra)/(Pra(Ra+delta*Ra)-Pra(Ra));
endfor

Ra
fminbnd(Pra, 0, 50)
