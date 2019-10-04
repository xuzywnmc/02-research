% 得到Haar小波的提升方案
lshaar=liftwave('haar');
% 添加ELS到提升方案中
els={'p',[-0.125 0.125],0};
lsnew=addlift(lshaar,els);
% 2层提升小波分解
load noisdopp;
x=noisdopp;
xDec=lwt(x,lsnew,2);
% 提取第1层的近似系数
ca1=lwtcoef('ca',xDec,lsnew,2,1);
% 提取第2层的近似系数
ca2=lwtcoef('ca',xDec,lsnew,2,2);
% 提取第1层的细节系数
cd1=lwtcoef('cd',xDec,lsnew,2,1);
% 提取第2层的细节系数
cd2=lwtcoef('cd',xDec,lsnew,2,2);
subplot(311);
plot(x);
title('原始信号');
subplot(323);
plot(ca1);
title('第一层近似信号');
subplot(324);
plot(ca2);
title('第二层近似信号');
subplot(325);
plot(cd1);
title('第一层细节信号');
subplot(326);
plot(cd2);
title('第二层细节信号');
