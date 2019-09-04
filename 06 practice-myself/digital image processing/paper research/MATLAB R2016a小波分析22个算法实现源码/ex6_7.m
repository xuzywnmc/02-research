 clear all;
t=0:pi/200:1;
s1=sin(t);
n=length(s1);
s2=randn(1,n);
s=s1+s2;
figure;        %效果如图6-12所示
plot(s);
title('原始信号');
ylabel('s');
[c,l]=wavedec(s,7,'db4');
figure;       %效果如图6-13所示
for i=1:7
    decmp=wrcoef('a',c,l,'db4',8-i);
    subplot(7,1,i);
    plot(decmp);
    ylabel(['a',num2str(8-i)]);
end
