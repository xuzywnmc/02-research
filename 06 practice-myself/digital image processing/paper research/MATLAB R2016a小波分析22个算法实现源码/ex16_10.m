% ��ǰ��չģʽ�ǲ���
% ����ԭʼһά�ź�s
randn('seed',531316785);
s=2+kron(ones(1,8),[1 -1])+((1:16).^2)/32+0.2*randn(1,16);
% ʹ��db2���е��߶�dwt
[ca1,cd1]=dwt(s,'db2');
subplot(221);plot(ca1);
title('db2��Ƶϵ��');
subplot(222);plot(cd1);
title('db2��Ƶϵ��');
% ���е��߶���ɢС����任
ss=idwt(ca1,cd1,'db2');
err=norm(s-ss); % ����ع�
subplot(212);plot([s;ss]');
title('ԭʼ�źź��ع��ź�');
xlabel(['��ص�2����Ϊ=',num2str(err)])
% ���ڸ�����С����������������ع��˲�������ֱ���������ǽ�����任
[Lo_R,Hi_R]=wfilters('db2','r');
ss=idwt(ca1,cd1,Lo_R,Hi_R);
