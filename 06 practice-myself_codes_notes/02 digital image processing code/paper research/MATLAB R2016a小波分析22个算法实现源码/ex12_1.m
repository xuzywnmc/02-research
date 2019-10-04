load noiswom
[swa,swh,swv,swd]=swt2(X,3,'db1');
% 使用db1小波对noiswom图像进行三层静态小波分解
whos
% 可以看出，swt2所小波分解同样不改变信号的长度，原来的96×96的图
% 像做了三层分解以后，分解系数是12个96×96的图像。
colormap(map)
kp=0;
for i=1:3
subplot(3,4,kp+1),image(wcodemat(swa(:,:,i),192));
title(['Approx,cfs,level',num2str(i)])
% 显示第i层近似系数图像，以192字节为单位编码  
subplot(3,4,kp+2),image(wcodemat(swh(:,:,i),192));
title(['Horiz.Det.cfs level',num2str(i)])
subplot(3,4,kp+3),image(wcodemat(swv(:,:,i),192));
 title(['Vert.Det.cfs level',num2str(i)])
subplot(3,4,kp+4),image(wcodemat(swd(:,:,i),192));
title(['Diag.Det.cfs level',num2str(i)])
kp=kp+4;
end
