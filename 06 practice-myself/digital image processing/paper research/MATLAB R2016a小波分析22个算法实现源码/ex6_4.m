clear all;
load nearbrk;   %载入信号
s=nearbrk;
figure;         %效果如图6-7所示
subplot(211);plot(s);
title('原始信号');
ylabel('s');
[c,l]=wavedec(s,7,'sym4');
a7=wrcoef('a',c,l,'sym4',7);
subplot(212);plot(a7);
ylabel('a7');
title('用sym4小波分解7层的近似系数');
figure;      %效果如图6-8所示
for i=1:7
    decmp=wrcoef('d',c,l,'sym4',8-i);
    subplot(7,1,i);plot(decmp);
    ylabel(['d',num2str(8-i)]);
end
title('用sym4小波分解7层的细节系数');
