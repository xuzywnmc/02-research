els={'p',[-0.125 0.125],0};
lsnew=addlift(lshaar,els);
% 2层提升小波分解
load noisdopp;
x=noisdopp;
xDec=lwt(x,lsnew,2);
% 重构近似信号和细节信号
a1=lwtcoef('a',xDec,lsnew,2,1);
a2=lwtcoef('a',xDec,lsnew,2,2);
d1=lwtcoef('d',xDec,lsnew,2,1);
d2=lwtcoef('d',xDec,lsnew,2,2);
% 检查重构误差
err=max(abs(x-a2-d2-d1))
subplot(311);
plot(x);
title('原始信号');
subplot(323);
plot(a1);
title('重构第一层近似信号');
subplot(324);
plot(a2);
title('重构第二层近似信号');
subplot(325);
plot(d1);
title('重构第一层细节信号');
subplot(326);
plot(d2);
title('重构第二层细节信号');
