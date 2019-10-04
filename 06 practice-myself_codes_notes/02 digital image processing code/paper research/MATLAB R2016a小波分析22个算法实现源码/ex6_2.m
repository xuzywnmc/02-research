 clear all;
load freqbrk;       %�����ź�
s=freqbrk;
ls=length(s);
[c,l]=wavedec(s,7,'db4');
figure;            %Ч����ͼ6-3��ʾ
subplot(211);plot(s);
title('ԭʼ�ź�');
ylabel('s');
fs=fft(s,1000);   %���źŽ���FFT�任
fs=abs(fs);
subplot(212);plot(fs);
ylabel('FFT');
grid on;
[c,l]=wavedec(s,3,'db4');  %��db4С�������źŷֽ�
a3=wrcoef('a',c,l,'db4',3); %�Էֽ�ṹ�ĵ������Ƶ�����ع�
%�Էֽ�ĸ���Ƶ�����ع�
figure;        %Ч����ͼ6-4��ʾ
for i=1:3
    decmp=wrcoef('d',c,l,'db4',4-i);
    subplot(3,1,i);
    plot(decmp);
    ylabel(['d',num2str(4-i)]);
end
