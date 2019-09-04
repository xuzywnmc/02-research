clear all;
t=0:pi/100:4*pi;
s1=sin(t);
s2=sin(4*t);
s3=sin(45*t);
s=s1+s2+s3;
figure;       %Ч����ͼ6-14��ʾ
plot(s);
title('ԭʼ�ź�');
ylabel('s');
figure;   %Ч����ͼ6-15��ʾ
[c,l]=wavedec(s,6,'db4');
%�Էֽ�ṹ�и���Ƶ���ֽ����ع�
for i=1:6
    decmp=wrcoef('a',c,l,'db4',7-i);
    subplot(6,2,2*i-1);
    plot(decmp);
    ylabel(['a',num2str(7-i)]);
end
%�Էֽ�ṹ�и���Ƶ���ֽ����ع�
for i=1:6
    decmp=wrcoef('d',c,l,'db4',7-i);
    subplot(6,2,2*i);
    plot(decmp);
    ylabel(['d',num2str(7-i)]);
end
%����d1�Ŵ���ͼ
figure;      %Ч����ͼ6-16��ʾ
d1=wrcoef('d',c,l,'db4',1);
plot(d1(1:100));
