clear all;
t=0:pi/100:2*pi;
s1=sin(t);
s2=sin(10*t);
s3=sin(t);
%�����ź�
s=[s1 s2 s3];
figure;         %Ч����ͼ6-5��ʾ
subplot(211);plot(s);
title('ԭʼ�ź�');
ylabel('s');
[c,l]=wavedec(s,7,'sym4');
a7=wrcoef('a',c,l,'sym4',7);
subplot(212);;plot(a7);
ylabel('a7');
title('��sym4С���ֽ�7��Ľ���ϵ��');
figure;       %Ч����ͼ6-6��ʾ
for i=1:7
    decmp=wrcoef('d',c,l,'sym4',8-i);
    subplot(7,1,i);
    plot(decmp);
    ylabel(['d',num2str(8-i)]);
end
title('��sym4С���ֽ�7���ϸ��ϵ��');
