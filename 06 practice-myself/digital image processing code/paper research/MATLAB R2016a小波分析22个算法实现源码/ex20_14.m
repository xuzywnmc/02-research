% װ���ź�
load noisdopp;
x=noisdopp;
figure(1);
subplot(221);
plot(x);
title('ԭʼ�ź�');
% ��db1С�����ֽ��ź�x��������
t=wpdec(x,3,'db1','shannon');
plot(t);% �����ṹͼ��
% ��ȡС������2��1����ϵ��
cfs=wpcoef(t,[2,1]);
figure(1);
subplot(222);
plot(cfs);
title('С������2��1����ϵ��');
