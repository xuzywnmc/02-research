% װ���ź�
load noisdopp;
x=noisdopp(1:1000);
figure(1);
subplot(211);
plot(x);
title('ԭʼ�ź�');
% ��db1С�����ֽ��ź�x��������
% ����shannon�صı�׼
t=wpdec(x,3,'db1','shannon');
plot(t);% ��С�������ṹ��ͼ��
recx=wprec(t);% �ع�С�����ֽ�ṹT
figure(1);
subplot(212);plot(recx);
title('�ع�����ź�');
