clear; close all
array_num = 10;                    % 阵元个数
dist = 0.3;                        % 阵元间距        
src_num = 3;                       % 信源数
theta = [-10, 20, 50, 70, 80];     % 波束来向
lambda = 0.6;                      % 载波波长
f = 10^6*[100, 300, 500, 600, 700];% 信号频率

d = 0:dist:(array_num - 1) * dist;
A = exp((-1i*2*pi*d.'*sin(theta*pi/180))/lambda);

sample_num = 1024;                 % 采样数
t = linspace(0, 1.024*10^-6, sample_num);
s = exp(1i*2*pi*f'*t);             % 信源信号
snr = 12;                          % 信噪比
x = awgn(A*s, snr);

%计算自相关矩阵
R = 1/sample_num * (x * x');

[capon_power, capon_res] = capon(R, d, src_num, lambda);
[music_power, music_res] = music(R, dist, src_num, lambda);
esprit_res = esprit(R, dist, src_num, lambda);

subplot(2,1,1)
plot(-90:0.05:90, capon_power)
title("capon")
xlim([-90,90])
xlabel("angle")
subplot(2,1,2)
plot(-90:0.05:90, music_power)
title("music")
xlim([-90,90])
xlabel("angle")
disp(capon_res)
disp(music_res)
disp(esprit_res)



% lambda = dist/0.25; 
% [music_power1, music_res1] = music(R, dist, src_num, lambda);
% lambda = dist/0.3;
% [music_power2, music_res2] = music(R, dist, src_num, lambda);
% lambda = dist/0.8;
% [music_power3, music_res3] = music(R, dist, src_num, lambda);
% lambda = dist/1;
% [music_power4, music_res4] = music(R, dist, src_num, lambda);
% lambda = dist/1.2;
% [music_power5, music_res5] = music(R, dist, src_num, lambda);
% 
% subplot(5,1,1)
% plot(-90:0.05:90, music_power1)
% title("d/lambda = 0.25")
% xlim([-90,90])
% xlabel("angle")
% subplot(5,1,2)
% plot(-90:0.05:90, music_power2)
% title("d/lambda = 0.3")
% xlim([-90,90])
% xlabel("angle")
% subplot(5,1,3)
% plot(-90:0.05:90, music_power3)
% title("d/lambda = 0.8")
% xlim([-90,90])
% xlabel("angle")
% subplot(5,1,4)
% plot(-90:0.05:90, music_power4)
% title("d/lambda = 1")
% xlim([-90,90])
% xlabel("angle")
% subplot(5,1,5)
% plot(-90:0.05:90, music_power5)
% title("d/lambda = 1.2")
% xlim([-90,90])
% xlabel("angle")




