clear all;
load scddvbrk;
s=scddvbrk;
figure;
subplot(211);plot(s);
title('ԭʼ�ź�');
ylabel('s');
%����С���ֽ�������ָ��
subplot(212);f=cwt(s,[1:2:128],'db4','plot');
title('С���ֽ�������ָ��');
xlabel('ʱ��');
ylabel('�߶ȱ任');
