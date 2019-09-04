% 低频信号由1～6层系数获得
cfs=[1];
mi=12;ma=30; % db6小波滤波器必须的
rec=upcoef('d',cfs,'db6',1);
figure(2)
subplot(611),plot(rec(3:12));
for i=2:6
    rec=upcoef('d',cfs,'db6',i);   
    subplot(6,1,i),plot(rec(mi*2^(i-2):ma*2^(i-2)))
end
subplot(611)
title(['由唯一的系数从尺度1到6获得的低频信号'])
