clear all;
load freqbrk;     %载入信号
s=freqbrk;
ls=length(s);
%利用db4小波对信号进行7层分解
[c,l]=wavedec(s,7,'db4');
subplot(211);plot(s);
title('原始信号');
ylabel('s');
%利用db4小波提取第7层的近似系数
a7=wrcoef('a',c,l,'db7',7);
subplot(212);plot(a7);
ylabel('a7');
title('用db小波分解7层的近似系数');  %效果如图6-1所示
figure;     
for i=1:7
    decmp=wrcoef('d',c,l,'db4',8-i);
    subplot(7,1,i);
    plot(decmp);
    ylabel(['d',num2str(8-i)]);
end
title('用db4小波分解7层的细节系数');  %效果如图6-2所示
