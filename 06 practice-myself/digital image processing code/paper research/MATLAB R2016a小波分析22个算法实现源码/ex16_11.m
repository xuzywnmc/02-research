% ��ǰ����ģʽ�ǲ���
% װ��һάԭʼ
load leleccum;s=leleccum(1:3920);ls=length(s);
% ʹ��db5���г߶�Ϊ3ʱ�ķֽ�
[c,l]=wavedec(s,3,'db5');
% ��С���ֽ�ṹ[c,l]�ع��ź�s
a0=waverec(c,l,'db5');
% ����ع�Ч��
err=norm(s-a0);
subplot(2,1,1);plot(s);title('ԭʼ�ź�')
subplot(2,1,2);plot(a0);title('�ع��ź�')
