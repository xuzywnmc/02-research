% ���ò������չģʽ
% װ��һά�߶��ź�
load leleccum;
s=leleccum(1:3920);
subplot(211);plot(s);
title('ԭʼ�ź�');
% ʹ��db1�ڵ�3����зֽ�
[c,l]=wavedec(s,3,'db1');
% ��С���ֽ���[c,l],��ȡ��3��ϵ������ֵ
ca3=appcoef(c,l,'db1',3);
subplot(2,1,2);plot(ca3);
