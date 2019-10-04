% 得到Haar小波的提升方案
lshaar=liftwave('haar');
% 添加ELS到提升方案中
els={'p',[-0.125 0.125],0};
lsnew=addlift(lshaar,els);
% 进行单层提升小波分解
load noisdopp;
x=noisdopp;
[cA,cD]=lwt(x,lsnew);
figure(1);
subplot(311);
plot(x);
title('原始信号');
subplot(312);
plot(cA);
title('提升小波分解的低频信号');
subplot(313);
plot(cD);
title('提升小波分解的高频信号');
% 直接使用Haar小波进行2层提升小波分解
[cA,cD]=lwt(x,'haar',2);
figure(2);
subplot(311);
plot(x);
title('原始信号');
subplot(312);
plot(cA);
title('2层提升小波分解的低频信号');
subplot(313);
plot(cD);
title('2层提升小波分解的高频信号');
