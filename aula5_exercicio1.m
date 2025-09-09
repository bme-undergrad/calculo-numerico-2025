clc
clear all
pkg load optim

# X = [x, y]
f = [6; 2];

# A*X <= b
A = [10, 1;
     5, 4;
     3, 7;
     1, 12;];
b = [10;
     20;
     21;
     12];

# Aeq*X = beq
Aeq = zeros(1,2);
beq = 0;

[x_star, fval] = linprog(f, -A, -b, Aeq, beq, lb=zeros(2,1), ub=100*ones(2,1))


# meshplot
x = 0:0.005:5; % Define x-range
y = 0:0.005:5; % Define y-range
[xx, yy] = meshgrid(x, y); % Create a grid of points

% Inequalities
mask1 = (10*xx + yy >= 10);
mask2 = (5*xx + 4*yy >= 20);
mask3 = (3*xx + 7*yy >= 21);
mask4 = (xx + 12*yy >= 12);
combined_mask = mask1 & mask2 & mask3 & mask4;

z_values_combined = zeros(size(xx));
z_values_combined(~combined_mask) = NaN;


xgrid = 0:0.05:5;
# linear
hold on
plot(xgrid, 10-10*xgrid)
plot(xgrid, 20/4-5/4*xgrid)
plot(xgrid, 3-3/7*xgrid)
plot(xgrid, 1-1/12*xgrid)
plot(x_star(1), x_star(2), 'ro')
xlabel('x');
ylabel('y');
grid on

# espaço de soluções
pcolor(xx, yy, z_values_combined);
shading flat;

xlim([0, 5])
ylim([0, 5])
zz = 6.*xx + 2.*yy;
contour(xx, yy, zz, 20)
hold off
