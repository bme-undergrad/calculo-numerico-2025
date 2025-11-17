clear all
clc
# f(x) = x^2


f = @(x)(x.^2);
a = 0;
b = 2;

I_real = 8/3

##############
n = 1;
I_1 = (f(b)+f(a))*(b-a)/2

##############
n = 2;
I_2 = (f(0)+f(1))*(1-0)/2 + (f(1)+f(2))*(2-1)/2

##############
n = 2;

I_n = 0;
h = (b-a)/n
for x_act = a+h:h:b
  x_ant = x_act - h;
  I_n = (f(x_act)+f(x_ant))*(x_act-x_ant)/2 + I_n;
endfor

I_n
