% 获得Haar小波的提升方案
lshaar=liftwave('haar');
% 将提升步骤ELS加入到提升方案中
els={'p',[-0.125 0.125],0};
lsnew=addlift(lshaar,els);
% 进行单层提升小波分解
load noisdopp;
x=noisdopp;
subplot(211);
plot(x);
ylabel('x');
% 实施提升小波变换
[cA,cD]=lwt(x,lsnew);
xRec=ilwt(cA,cD,lsnew);
err=max(max(abs(x-xRec)))
subplot(212);
plot(xRec);
ylabel('xRec');
