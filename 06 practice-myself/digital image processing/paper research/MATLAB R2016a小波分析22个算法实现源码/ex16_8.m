% ��ǰ��չģʽ�ǲ���ģʽ
% ����ԭʼһά�߶��ź�
randn('seed',531316785)
s=2+kron(ones(1,8),[1,-1])+((1:16).^2)/32+0.2*randn(1,16);
% ���е��߶���ɢhaarС���任
[ca1,cd1]=dwt(s,'haar');
subplot(311);plot(s);title('ԭʼ�ź�');
subplot(323);plot(ca1);title('haar��Ƶϵ��');
subplot(324);plot(cd1);title('haar��Ƶϵ��');
% ���ڸ�����С��������������صķֽ��˲�������ֱ��ʹ�ø��˲��������Ƶ�͸�Ƶϵ��
[Lo_D,Hi_D]=wfilters('haar','d');
[ca1,cd1]=dwt(s,Lo_D,Hi_D);
% ���е��߶�db2��ɢС���任���۲����ϵ���ı�ԵЧ��
[ca2,cd2]=dwt(s,'db2');
subplot(325);plot(ca2);title('haar��Ƶϵ��');
subplot(326);plot(cd2);title('haar��Ƶϵ��');
