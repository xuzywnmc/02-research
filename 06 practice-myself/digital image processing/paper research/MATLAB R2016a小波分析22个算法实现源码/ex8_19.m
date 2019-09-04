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
a2=lwtcoef2('a',xDec,lsnew,2,2);
h1=lwtcoef2('h',xDec,lsnew,2,1);
v1=lwtcoef2('v',xDec,lsnew,2,1);
d1=lwtcoef2('d',xDec,lsnew,2,1);
h2=lwtcoef2('h',xDec,lsnew,2,2);
v2=lwtcoef2('v',xDec,lsnew,2,2);
d2=lwtcoef2('d',xDec,lsnew,2,2);
% 检查重构误差
err=max(max(abs(X-a2-h2-v2-d2-h1-v1-d1)))
nbc=size(map,1);
colormap(pink(nbc));
subplot(121);
image(wcodemat(X,nbc));
title('原始图像');
subplot(122);
image(wcodemat(a2,nbc));
title('重构第二层近似图像');
figure;
subplot(231);
image(wcodemat(h1,nbc));
title('第一层水平方向图像');
subplot(232);
image(wcodemat(v1,nbc));
title('第一层垂直方向图像');
subplot(233);
image(wcodemat(d1,nbc));
title('第一层对角方向图像');
subplot(234);
image(wcodemat(h2,nbc));
title('第二层水平方向图像');
subplot(235);
image(wcodemat(v2,nbc));
title('第二层垂直方向图像');
subplot(236);
image(wcodemat(d2,nbc));
title('第二层对角方向图像');
