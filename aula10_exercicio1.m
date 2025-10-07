clear all
close all
clc

x = 1:7;
y = [0.5, 2.5, 2.0, 4.0, 3.5, 6.0, 5.5];

n = length(y);

disp('v1')
a1 = ( n*sum(x.*y) - sum(x)*sum(y) )/( n*sum(x.^2) - sum(x)^2 )
a0 = sum(y)/n - a1*sum(x)/n

##disp('v2')
a1 = ( n*x*y' - sum(x) * sum(y) )/( n*x*x' - sum(x)^2 );
a0 = mean(y) - a1*mean(x);

St = sum( (y - mean(y)).^2 )
Sr = sum( (y - a0 - a1*x).^2 )

r2 = (St - Sr)/St

sy = sqrt(St/(n-1))
s_yx = sqrt(Sr/(n-2))

std(y) % = sy

%%%%%%%%%%%% POLYFIT

grau = 1
p = polyfit(x, y, grau)
p2 = polyfit(x, y, grau+1)

plot(x, y, 'o')
hold on
grid on
plot(x, a0+a1*x)
plot(x, p(2)+p(1)*x, 'k--')
plot(x, p2(3)+p2(2)*x+p2(1)*x.^2)
hold off


