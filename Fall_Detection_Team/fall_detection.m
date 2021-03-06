%%
clear all;
close all;
clc;

%% Data for testing

participantNum = 2;

data = csvread("..\..\Fall_Detection_Team\Participant-Data\Participant " + participantNum + "\Raw\testing" + participantNum + "_forward.csv");
% time2 = 0:30/length(data2):(length(data2)-1)*30/length(data2);
g = data(:,1:3);
e = data(:,7:9);

figure(1)
legend("pitch", "roll")
title("Euler")
plot(e(:,2:3))

% figure(2)
% title("Gyro")
% subplot(2,1,2)
% plot(g2(:,2:3))

% range = 1:length(e);

pitch_1 = e(:,2);
roll_1 = e(:,3);
gx_1 = g(:,1);
gy_1 = g(:,2);
gz_1 = g(:,3);

%% Finding thresh

data_ticks = 1;
circBuff_roll = zeros(31);
% circBuff_pitch = zeros(31);
% circBuff_gyrox = zeros(31);
% circBuff_gyroy = zeros(31);
% circBuff_gyroz = zeros(31);

range = 2533:2615;

for i = 2533:2564
    circBuff_roll(i-2532) = roll_1(i);
%     circBuff_pitch(i) = pitch_1(i);
%     circBuff_gyrox(i) = gyro_x(i);
%     circBuff_gyroy(i) = gyro_y(i);
%     circBuff_gyroz(i) = gyro_z(i);
    data_ticks = data_ticks + 1;
end

min = 100;
max = -100;
minTick = 0;
maxTick = 0;

for i = 2565:2615
    diffRoll = roll_1(i) - circBuff_roll(mod(i-2564, 31) + 1);
    if min > diffRoll 
        min = diffRoll;
        minTick = data_ticks;
    end
    if max < diffRoll
        max = diffRoll;
        maxTick = data_ticks;
    end
    
    circBuff_roll(mod(i-2564, 40) + 1) = roll_1(i);
    data_ticks = data_ticks + 1;
end

out1 = sprintf("%d %d", minTick, min);
out2 = sprintf("%d %d", maxTick, max);
disp(out1)
disp(out2)

%% Algorithm

%current reporitng frequency at 155hz

%fall flags for debouncing
foward_flag = 0;

%buffers for data
circBuff_roll = zeros(31);
circBuff_pitch = zeros(31);
circBuff_gyrox = zeros(31);
circBuff_gyroy = zeros(31);
circBuff_gyroz = zeros(31);

data_ticks = 1;


for i = 1:31
    circBuff_roll(i) = roll_1(i);
%     circBuff_pitch(i) = pitch_1(i);
%     circBuff_gyrox(i) = gyro_x(i);
%     circBuff_gyroy(i) = gyro_y(i);
%     circBuff_gyroz(i) = gyro_z(i);
    data_ticks = data_ticks + 1;
end

for i = 31:length(e)
    diffRoll = roll_1(i) - circBuff_roll(mod(i, 31) + 1);
%     diffPitch = pitch_1(i) - circBuff_pitch(mod(i, 31) + 1);
%     diffGyroX = gyro_x(i) - circBuff_gyrox(mod(i, 40) + 1);
%     diffGyroY = gyro_y(i) - circBuff_gyroy(mod(i, 40) + 1); 
%     diffGyroZ = gyro_z(i) - circBuff_gyroz(mod(i, 40) + 1);

    if(diffRoll >=2.61  && diffRoll <= 16.5)
        x = sprintf("%d fall", data_ticks); 
        disp(x)
    end

    circBuff_roll(mod(i, 40) + 1) = roll_1(i);
    data_ticks = data_ticks + 1;
end




















