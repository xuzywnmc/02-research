clear;
clc;
% 得到Haar小波的提升方案
lshaar=liftwave('haar');
% 添加ELS到提升方案中
els={'p',[-0.125 0.125],0};
lsnew=addlift(lshaar,els);
% 2层提升小波分解
load woman;
xDec=lwt2(X,lsnew,2);
% 提取近似图像和细节图像
ca2=lwtcoef2('ca',xDec,lsnew,2,2);
ch1=lwtcoef2('ch',xDec,lsnew,2,1);
cv1=lwtcoef2('cv',xDec,lsnew,2,1);
cd1=lwtcoef2('cd',xDec,lsnew,2,1);
ch2=lwtcoef2('ch',xDec,lsnew,2,2);
cv2=lwtcoef2('cv',xDec,lsnew,2,2);
cd2=lwtcoef2('cd',xDec,lsnew,2,2);
nbc=size(map,1);
colormap(pink(nbc));
subplot(121);
image(wcodemat(X,nbc));
title('原始图像');
subplot(122);
image(wcodemat(ca2,nbc));
title('第二层近似图像');
figure;
subplot(231);
image(wcodemat(ch1,nbc));
title('第一层水平方向图像');
subplot(232);
image(wcodemat(cv1,nbc));
title('第一层垂直方向图像');
subplot(233);
image(wcodemat(cd1,nbc));
title('第一层对角方向图像');
subplot(234);
image(wcodemat(ch2,nbc));
title('第二层水平方向图像');
subplot(235);
image(wcodemat(cv2,nbc));
title('第二层垂直方向图像');
subplot(236);
image(wcodemat(cd2,nbc));
title('第二层对角方向图像');
