%���������ź�
N=1000;
t=1:N;
x=sin(0.03*t);
%������
load noissin;
ns=noissin;
%��ʾ����
subplot(3,1,1);
plot(t,x);
title('(a)ԭʼ�ź�');
ylabel('��ֵ A');
subplot(3,1,2);
plot(ns);
title('(b)�����ź�');
ylabel('��ֵ A');
%С������
xd=wden(ns,'minimaxi','s','one',5,'db3');
subplot(3,1,3);
plot(xd);
title('(c)�����ź�');
ylabel('��ֵ A');
