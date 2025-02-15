load wbarb
% 使用sym4小波对信号进行一层小波分解
[ca1,ch1,cv1,cd1]=dwt2(X,'sym4');
codca1=wcodemat(ca1,192);
codch1=wcodemat(ch1,192);
codcv1=wcodemat(cv1,192);
codcd1=wcodemat(cd1,192);
% 将四个系数图像组合为一个图像
codx=[codca1,codch1,codcv1,codcd1]
% 复制原图像的小波系数
rca1=ca1;
rch1=ch1;
rcv1=cv1;
rcd1=cd1;
% 将三个细节系数的中部置零
rch1(33:97,33:97)=zeros(65,65);
rcv1(33:97,33:97)=zeros(65,65);
rcd1(33:97,33:97)=zeros(65,65);
codrca1=wcodemat(rca1,192);
codrch1=wcodemat(rch1,192);
codrcv1=wcodemat(rcv1,192);
codrcd1=wcodemat(rcd1,192);
% 将处理后的系数图像组合为一个图像
codrx=[codrca1,codrch1,codrcv1,codrcd1]
% 重建处理后的系数
rx=idwt2(rca1,rch1,rcv1,rcd1,'sym4');
subplot(221);image(wcodemat(X,192))
colormap(map);
title('原始图像');
subplot(222);image(codx)
colormap(map);
title('一层分解后各层系数图像');
subplot(223);image(wcodemat(rx,192)),
colormap(map);
title('压缩图像');
subplot(224);image(codrx),
colormap(map);
title('处理后各层系数图像');
% 求压缩信号的能量成分
per=norm(rx)/norm(X)
per =1.0000
% 求压缩信号与原信号的标准差
err=norm(rx-X)
