 clear all;
t=0:pi/200:1;
s1=sin(t);
n=length(s1);
s2=randn(1,n);
s=s1+s2;
figure;        %Ч����ͼ6-12��ʾ
plot(s);
title('ԭʼ�ź�');
ylabel('s');
[c,l]=wavedec(s,7,'db4');
figure;       %Ч����ͼ6-13��ʾ
for i=1:7
    decmp=wrcoef('a',c,l,'db4',8-i);
    subplot(7,1,i);
    plot(decmp);
    ylabel(['a',num2str(8-i)]);
end
