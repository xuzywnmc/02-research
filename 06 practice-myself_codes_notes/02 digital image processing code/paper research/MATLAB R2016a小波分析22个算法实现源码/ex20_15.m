% װ���ź�
load noisdopp;
x=noisdopp(1:1000);
figure(1);
subplot(121);
plot(x);
title('ԭʼ�ź�');
% ��db1С�����ֽ��ź�x��������
t=wpdec(x,3,'db1','shannon');
plot(t);% �����ṹ��ͼ��
% �ع�С�����Ľ�㣨2��1��
rcfs=wprcoef(t,[2,1]);
figure(1);
subplot(122);
plot(rcfs);
title('�ع���С������㣨2��1��');
