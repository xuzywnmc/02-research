load sumsin;s=sumsin;
subplot(211);plot(s);title('ԭʼ�ź�');
% ʹ��sym4���г߶�Ϊ5�ķֽ�
[c,l]=wavedec(s,5,'sym4');
% ��С���ֽ�ṹ[C,L]���ع��߶�Ϊ5�ĵ�Ƶ����
a5=wrcoef('a',c,l,'sym4',5);
subplot(212);plot(a5);title('�ع���Ƶ�ź�');
