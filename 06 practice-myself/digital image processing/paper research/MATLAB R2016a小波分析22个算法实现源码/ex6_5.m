lear all;
t=0:0.002:4;
s1=exp(t);
s2=exp(3*t);
s=[s1,s2];
figure;       %Ч����ͼ6-9��ʾ
subplot(211);plot(s);
title('ԭʼ�ź�');
ylabel('s');
%�����ź�һ�׵���
ds=diff(s);
ylabel('�źŵ���');
[c,l]=wavedec(s,4,'db4');
a4=wrcoef('a',c,l,'db4',4);
subplot(212);plot(a4);
ylabel('a4');
title('�źŵĵ���');
figure;       %Ч����ͼ6-10��ʾ
for i=1:4
    decmp=wrcoef('d',c,l,'db4',5-i);
    subplot(4,1,i);
    plot(decmp);
    ylabel(['d',num2str(5-i)]);
end
