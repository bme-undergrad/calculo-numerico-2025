clc
clear all

x = 2;
y_real = exp(2)

% meu cálculo de exp
N = 15;

minha_exp = 0
for n = 0:N
  minha_exp = minha_exp + x^n/factorial(n)
end
