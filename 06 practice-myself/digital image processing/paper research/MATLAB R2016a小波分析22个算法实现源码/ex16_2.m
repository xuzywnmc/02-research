% 装载nossin信号
load noissin;
x=noissin;
figure(1);
plot(x);
figure(2);
subplot(121);
% 用db4小波函数进行一维连续小波变换
c=cwt(x,1:48,'db4','plot');
subplot(122);
% 重新选择尺度后进行一维连续小波变换
c=cwt(x,2:2:128,'db4','plot');
figure(3);
% 使用复小波对其进行连续小波变换
c=cwt(x,2:2:128,'cgau4','plot');
