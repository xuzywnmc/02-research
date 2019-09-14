 clear all;
load freqbrk;       %载入信号
s=freqbrk;
ls=length(s);
[c,l]=wavedec(s,7,'db4');
figure;            %效果如图6-3所示
subplot(211);plot(s);
title('原始信号');
ylabel('s');
fs=fft(s,1000);   %对信号进行FFT变换
fs=abs(fs);
subplot(212);plot(fs);
ylabel('FFT');
grid on;
[c,l]=wavedec(s,3,'db4');  %用db4小波进行信号分解
a3=wrcoef('a',c,l,'db4',3); %对分解结构的第三层低频进行重构
%对分解的各高频进行重构
figure;        %效果如图6-4所示
for i=1:3
    decmp=wrcoef('d',c,l,'db4',4-i);
    subplot(3,1,i);
    plot(decmp);
    ylabel(['d',num2str(4-i)]);
end
