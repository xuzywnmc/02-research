clear all;
t=0:pi/100:4*pi;
s1=sin(t);
s2=sin(4*t);
s3=sin(45*t);
s=s1+s2+s3;
figure;       %效果如图6-14所示
plot(s);
title('原始信号');
ylabel('s');
figure;   %效果如图6-15所示
[c,l]=wavedec(s,6,'db4');
%对分解结构中各低频部分进行重构
for i=1:6
    decmp=wrcoef('a',c,l,'db4',7-i);
    subplot(6,2,2*i-1);
    plot(decmp);
    ylabel(['a',num2str(7-i)]);
end
%对分解结构中各高频部分进行重构
for i=1:6
    decmp=wrcoef('d',c,l,'db4',7-i);
    subplot(6,2,2*i);
    plot(decmp);
    ylabel(['d',num2str(7-i)]);
end
%绘制d1放大波形图
figure;      %效果如图6-16所示
d1=wrcoef('d',c,l,'db4',1);
plot(d1(1:100));
