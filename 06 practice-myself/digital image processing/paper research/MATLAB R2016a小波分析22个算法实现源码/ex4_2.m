t=0:pi/100:4*pi;
s=sin(t+pi/4);
subplot(532);plot(s);
title('原始信号');
[c,l]=wavedec(s,3,'db1');grid;
ca3=appcoef(c,l,'db1',3);   %提取小波分解的低频系数
cd3=detcoef(c,l,3);   %提取第三层的高频系数
cd2=detcoef(c,l,2);   %提取第二层的高频系数
cd1=detcoef(c,l,1);   %提取第一层的高频系数
figure(2);
subplot(421);plot(ca3);
title(' db1第三层低频系数');
subplot(423);plot(cd1);
title(' db1第一层高频系数');
subplot(425);plot(cd2);
title(' db1第二层高频系数');
subplot(427);plot(cd3);
title(' db1第三层高频系数');
[c,l]=wavedec(s,3,'coif3');grid;
s1=waverec(c,l,'coif3')
ca3=appcoef(c,l,'coif3',3);   %提取小波分解的低频系数
cd3=detcoef(c,l,3);   %提取第三层的高频系数
cd2=detcoef(c,l,2);   %提取第二层的高频系数
cd1=detcoef(c,l,1);   %提取第一层的高频系数
subplot(422);plot(ca3);
title(' coif3第三层低频系数');
subplot(424);plot(cd1);
title(' coif3第一层高频系数');
subplot(426);plot(cd2);
title(' coif3第二层高频系数');
subplot(428);plot(cd3);
title(' coif3第三层高频系数');
s2=waverec(c,l,'coif3')
figure(3);
subplot(521);plot(s1);grid;
title('db1小波重构信号');
[c,l]=wavedec(s,3,'coif3');
subplot(522);plot(s2);grid;
title('coif3小波重构信号');
