% 得到Haar小波的提升方案
lshaar=liftwave('haar');
% 将提升步骤ELS添加到提升方案中
els={'p',[-0.125 0.125],0};
lsnew=addlift(lshaar,els);
% 2层提升小波分解
load noisdopp;
x=noisdopp;
subplot(211);
plot(x);
ylabel('x');
% 对信号实施整数提升小波变换
lshaarInt=liftwave('haar','int2int');
lsnewInt=addlift(lshaarInt,els);
[cAint,cDint]=lwt(x,lsnewInt);
% 实施提升小波变换
xRecInt=ilwt(cAint,cDint,lsnewInt);
errInt=max(max(abs(x-xRecInt)))
subplot(212);
plot(xRecInt);
ylabel('xRecInt');
