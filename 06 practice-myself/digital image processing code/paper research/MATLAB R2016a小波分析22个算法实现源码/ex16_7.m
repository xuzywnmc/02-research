% ��ǰ����ģʽ�ǲ���
% װ��һάԭʼ�ź�
load sumsin;s=sumsin
subplot(211);plot(s)'
title('ԭʼ�ź�');
% ʹ��db1����3��ֽ�
[c,l]=wavedec(s,3,'db1');
subplot(212);plot(c);title('С���ֽ�ṹ');
Xlabel('��Ƶϵ���͵�3,2,1��ĸ�Ƶϵ��');
