t=0:pi/100:4*pi;
s=sin(t+pi/4);
subplot(532);plot(s);
title('ԭʼ�ź�');
[c,l]=wavedec(s,3,'db1');grid;
ca3=appcoef(c,l,'db1',3);   %��ȡС���ֽ�ĵ�Ƶϵ��
cd3=detcoef(c,l,3);   %��ȡ������ĸ�Ƶϵ��
cd2=detcoef(c,l,2);   %��ȡ�ڶ���ĸ�Ƶϵ��
cd1=detcoef(c,l,1);   %��ȡ��һ��ĸ�Ƶϵ��
figure(2);
subplot(421);plot(ca3);
title(' db1�������Ƶϵ��');
subplot(423);plot(cd1);
title(' db1��һ���Ƶϵ��');
subplot(425);plot(cd2);
title(' db1�ڶ����Ƶϵ��');
subplot(427);plot(cd3);
title(' db1�������Ƶϵ��');
[c,l]=wavedec(s,3,'coif3');grid;
s1=waverec(c,l,'coif3')
ca3=appcoef(c,l,'coif3',3);   %��ȡС���ֽ�ĵ�Ƶϵ��
cd3=detcoef(c,l,3);   %��ȡ������ĸ�Ƶϵ��
cd2=detcoef(c,l,2);   %��ȡ�ڶ���ĸ�Ƶϵ��
cd1=detcoef(c,l,1);   %��ȡ��һ��ĸ�Ƶϵ��
subplot(422);plot(ca3);
title(' coif3�������Ƶϵ��');
subplot(424);plot(cd1);
title(' coif3��һ���Ƶϵ��');
subplot(426);plot(cd2);
title(' coif3�ڶ����Ƶϵ��');
subplot(428);plot(cd3);
title(' coif3�������Ƶϵ��');
s2=waverec(c,l,'coif3')
figure(3);
subplot(521);plot(s1);grid;
title('db1С���ع��ź�');
[c,l]=wavedec(s,3,'coif3');
subplot(522);plot(s2);grid;
title('coif3С���ع��ź�');
