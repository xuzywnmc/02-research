clear all;
load freqbrk;     %�����ź�
s=freqbrk;
ls=length(s);
%����db4С�����źŽ���7��ֽ�
[c,l]=wavedec(s,7,'db4');
subplot(211);plot(s);
title('ԭʼ�ź�');
ylabel('s');
%����db4С����ȡ��7��Ľ���ϵ��
a7=wrcoef('a',c,l,'db7',7);
subplot(212);plot(a7);
ylabel('a7');
title('��dbС���ֽ�7��Ľ���ϵ��');  %Ч����ͼ6-1��ʾ
figure;     
for i=1:7
    decmp=wrcoef('d',c,l,'db4',8-i);
    subplot(7,1,i);
    plot(decmp);
    ylabel(['d',num2str(8-i)]);
end
title('��db4С���ֽ�7���ϸ��ϵ��');  %Ч����ͼ6-2��ʾ
