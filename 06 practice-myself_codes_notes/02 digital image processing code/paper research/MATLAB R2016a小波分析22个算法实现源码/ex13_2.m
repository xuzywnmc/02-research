t=0:pi/125:4*pi;
s1=sin(t); % ����һ�����ź�
s2=sin(10*t) %����һ�����źţ�������Ƶ�ʵ�ͻ��
s3=sin(t) % ����һ�����ź�
s=[s1,s2,s3]; % �����ź�
subplot(421);plot(s)
title('ԭʼ�ź�');
ylabel('s');
[c,l]=wavedec(s,6,'db3'); % ����db3С�������źŽ�������ֽ�
apcmp=wrcoef('a',c,l,'db3',6);
subplot(422);plot(apcmp);
ylabel('ca6');
for i=1:6
    decmp=wrcoef('d',c,l,'db3',7-i);
    subplot(4,2,i+2);
    plot(decmp);
    ylabel(['d',num2str(7-i)]);
end
