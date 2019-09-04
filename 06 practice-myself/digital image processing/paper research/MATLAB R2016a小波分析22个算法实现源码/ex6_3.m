clear all;
t=0:pi/100:2*pi;
s1=sin(t);
s2=sin(10*t);
s3=sin(t);
%整个信号
s=[s1 s2 s3];
figure;         %效果如图6-5所示
subplot(211);plot(s);
title('原始信号');
ylabel('s');
[c,l]=wavedec(s,7,'sym4');
a7=wrcoef('a',c,l,'sym4',7);
subplot(212);;plot(a7);
ylabel('a7');
title('用sym4小波分解7层的近似系数');
figure;       %效果如图6-6所示
for i=1:7
    decmp=wrcoef('d',c,l,'sym4',8-i);
    subplot(7,1,i);
    plot(decmp);
    ylabel(['d',num2str(8-i)]);
end
title('用sym4小波分解7层的细节系数');
