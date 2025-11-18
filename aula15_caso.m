clear all
close all
clc


data = csvread('2025-11-17_12-22-19/Accelerometer.csv')(2:end,1:5);

idx_init = 658; # 658
idx_end = 1131; # 1131
t = data(idx_init:idx_end, 2);
accel_y = data(idx_init:idx_end, 4);
accel_x = data(idx_init:idx_end, 5);


plot(t, accel_x)
hold on
##plot(accel_y)
hold off


vel_x = zeros(length(accel_x), 1);
vel_y = zeros(length(accel_y), 1);

for ii = 2:length(accel_x)
  vel_x(ii) = (accel_x(ii)+accel_x(ii-1))*(t(ii)-t(ii-1))/2 + vel_x(ii-1);
  vel_y(ii) = (accel_y(ii)+accel_y(ii-1))*(t(ii)-t(ii-1))/2 + vel_y(ii-1);
endfor

figure(2)
plot(t, vel_x)
hold on
plot(t, vel_y)
hold off


pos_x = zeros(length(accel_x), 1);
pos_y = zeros(length(accel_x), 1);

for ii = 2:length(accel_x)
  pos_x(ii) = (vel_x(ii)+vel_x(ii-1))*(t(ii)-t(ii-1))/2 + pos_x(ii-1);
  pos_y(ii) = (vel_y(ii)+vel_y(ii-1))*(t(ii)-t(ii-1))/2 + pos_y(ii-1);
endfor

figure(3)
plot(t, pos_x)
hold on
plot(t, pos_y)
hold off

figure(4)
plot(pos_x, pos_y)


# derivada
jerk_x = zeros(length(accel_x), 1);
jerk_y = zeros(length(accel_x), 1);
for ii = 2:length(accel_x)
  jerk_x(ii) = (accel_x(ii)-accel_x(ii-1))/(t(ii)-t(ii-1));
  jerk_y(ii) = (accel_y(ii)-accel_y(ii-1))/(t(ii)-t(ii-1));
endfor

jerk_x_diff = diff(accel_x)./diff(t);

figure(5)
plot(t, jerk_x)
hold on
plot(t(2:end), jerk_x_diff, 'o')
hold off
