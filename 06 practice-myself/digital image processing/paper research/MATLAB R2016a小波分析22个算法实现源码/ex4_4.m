% 信号的傅立叶变换
load freqbrk; % 装入要分析的信号
s=freqbrk;
ls=length(s);
subplot(6,1,1);plot(s);title('原始信号的时域图');
% 对信号s进行FFT变换
fs=fft(s,1024); % 在s信号中取1024个点，倘若s中不够长，则后面补零
fs=abs(fs); % 将FFT后的复数用abs求其模的大小，返回的值是复数的模
subplot(6,1,2);plot(fs);
ylabel('FFT');grid;
% 信号用db1小波分解到第三层后的频域特性
[c,l]=wavedec(s,3,'db1'); % 用db1小波分解信号到第三层
% 对分解结构[c,l]的第三层低频部分进行重构
a3=wrcoef('a',c,l,'db1',3);
subplot(6,1,3);plot(a3);ylabel('a3');
% 对分解结构[c,l]中的各层高频部分进行重构
for i=1:3
    decmp=wrcoef('d',c,l,'db1',4-i);
    subplot(6,1,i+3);
    plot(decmp);
    ylabel(['d',int2str(4-i)]);
end
