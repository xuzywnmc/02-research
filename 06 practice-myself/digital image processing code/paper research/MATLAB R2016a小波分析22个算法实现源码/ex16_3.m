% ���ò������չģʽ
% װ��һά�߶��ź�
load leleccum;
s=leleccum(1:3920);
% ʹ��db1�ڵ�3����зֽ�
[c,l]=wavedec(s,3,'db1');
subplot(411);plot(s);
title('ԭʼ�ź�');
% ��С���ֽ�ṹ����ȡ1��2��3���ϸ��ϵ��
[cd1,cd2,cd3]=detcoef(c,l,[1 2 3]);
% ��ͼ����
subplot(412);plot(cd3);Ylabel('cd3');
subplot(413);plot(cd2);Ylabel('cd2');
subplot(414);plot(cd1);Ylabel('cd1');
