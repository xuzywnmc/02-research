% ���ò������չģʽ
% װ��һά�߶��ź�
load sumsin;s=sumsin;
% ʹ��db1�ڵ�3��С���ֽ�
[c,l]=wavedec(s,3,'db1');
subplot(311);plot(s);
title('ԭʼ�ź�s.');
subplot(312);plot(c);
title('3��С���ֽ�ṹ');
xlabel(['��3��ĵ�Ƶϵ���Լ���3��2��1��ĸ�Ƶϵ��'])
% ��3���С���ֽ�ṹ�����ع�
% ����µĽṹ[nc,nl]��2��С���ֽ�ṹ
[nc,nl]=upwlev(c,l,'db1');
subplot(313);plot(nc);
title('2��С���ֽ�ṹ')
xlabel(['��2��ĵ�Ƶϵ������1��2��ĸ�Ƶϵ��'])

