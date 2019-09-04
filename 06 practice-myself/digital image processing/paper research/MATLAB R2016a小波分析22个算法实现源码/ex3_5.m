load wbarb;
subplot(1,2,1);

image(X);
colormap(map);
title('原始图像');

%采用默认的全局阈值
[thr,sorh,keepapp,crit]=ddencmp('cmp','wp',X);
%图像进行压缩
Xc=wpdencmp(X,sorh,3,'bior3.1',crit,thr,keepapp);

%显示压缩结果
subplot(1,2,2);
image(Xc);
colormap(map);
title('全局阈值压缩图像');
