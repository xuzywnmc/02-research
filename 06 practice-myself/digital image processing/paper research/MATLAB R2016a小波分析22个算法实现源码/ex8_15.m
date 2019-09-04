% 得到Haar小波的提升方案
lshaar=liftwave('haar');
% 添加ELS到提升方案中
els={'p',[-0.125 0.125],0};
lsnew=addlift(lshaar,els);
load woman;
% 进行一层提升小波分解
[cA,cH,cV,cD]=lwt2(X,lsnew);
figure(1);
nbc=size(map,1);
colormap(pink(nbc));
subplot(321);
image(wcodemat(X,nbc));
title('原始图像');
subplot(322);
image(wcodemat(cA,nbc));
title('提升小波分解的低频图像');
subplot(323);
image(wcodemat(cH,nbc));
title('水平方向高频图像');
subplot(324);
image(wcodemat(cV,nbc));
title('垂直方向高频图像');
subplot(325);
image(wcodemat(cD,nbc));
title('对角方向高频图像');
