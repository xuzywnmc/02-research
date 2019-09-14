lear all;
t=0:0.002:4;
s1=exp(t);
s2=exp(3*t);
s=[s1,s2];
figure;       %效果如图6-9所示
subplot(211);plot(s);
title('原始信号');
ylabel('s');
%计算信号一阶导数
ds=diff(s);
ylabel('信号导数');
[c,l]=wavedec(s,4,'db4');
a4=wrcoef('a',c,l,'db4',4);
subplot(212);plot(a4);
ylabel('a4');
title('信号的导数');
figure;       %效果如图6-10所示
for i=1:4
    decmp=wrcoef('d',c,l,'db4',5-i);
    subplot(4,1,i);
    plot(decmp);
    ylabel(['d',num2str(5-i)]);
end
