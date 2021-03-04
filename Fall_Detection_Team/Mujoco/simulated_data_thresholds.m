%% plot the simulated data

clear all;
close all;
clc;

range = 1000:1300;
sim_data = csvread('eulers_trial5.csv');
x = sim_data(range, :);
time = 0:1/200:(length(x) - 1)/200;

more_data = csvread('trial5.csv');
y = more_data(range, :);
time2 = 0:1/200:(length(y) - 1)/200;

% plot(sim_data)
figure(1)
data1 = sim_data(range, 1);
plot(time, data1)
hold on
data2 = sim_data(range, 2);
plot(time, data2)
data3 = sim_data(range, 3);
plot(time, data3)
legend("yaw", "pitch", "roll")

figure(2)
data4 = more_data(range, 1);
plot(time2, data4*180/pi)
hold on
data5 = more_data(range, 2);
plot(time2, data5*180/pi)
data6 = more_data(range, 3);
plot(time2, data6*180/pi)
legend("x", "y", "z")

range2 = 1500:2100;
% sim_data = csvread('eulers_trial5.csv')
x = sim_data(range2, :);
time = 0:1/200:(length(x) - 1)/200;

% more_data = csvread('trial5.csv')
y = more_data(range2, :);
time2 = 0:1/200:(length(y) - 1)/200;

% plot(sim_data)
figure(3)
data1 = sim_data(range2, 1);
plot(time, data1)
hold on
data2 = sim_data(range2, 2);
plot(time, data2)
data3 = sim_data(range2, 3);
plot(time, data3)
legend("yaw", "pitch", "roll")

figure(4)
data4 = more_data(range2, 1);
plot(time2, data4*180/pi)
hold on
data5 = more_data(range2, 2);
plot(time2, data5*180/pi)
data6 = more_data(range2, 3);
plot(time2, data6*180/pi)
legend("x", "y", "z")