clear all
clc

V_star   = @(h)(14*pi*h^2-2/3*pi*h^3-30);
V_star_d = @(h)(28*pi*h-2*pi*h^2);

h = zeros(10,1)
h(1) = 3;
h
erro = zeros(length(h), 1);

for ii = 1:length(h)-1
  ii
  if ii ~= 1
    erro(ii) = abs((h(ii)-h(ii-1))/h(ii))
    if erro(ii) < 0.01
      break
    endif
  endif
  h(ii+1) = h(ii) - V_star(h(ii))/V_star_d(h(ii))
endfor
