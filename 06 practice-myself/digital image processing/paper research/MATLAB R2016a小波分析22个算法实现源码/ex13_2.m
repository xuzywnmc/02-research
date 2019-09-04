t=0:pi/125:4*pi;
s1=sin(t); % 设置一正常信号
s2=sin(10*t) %设置一故障信号，表现在频率的突变
s3=sin(t) % 设置一正常信号
s=[s1,s2,s3]; % 整个信号
subplot(421);plot(s)
title('原始信号');
ylabel('s');
[c,l]=wavedec(s,6,'db3'); % 采用db3小波并对信号进行六层分解
apcmp=wrcoef('a',c,l,'db3',6);
subplot(422);plot(apcmp);
ylabel('ca6');
for i=1:6
    decmp=wrcoef('d',c,l,'db3',7-i);
    subplot(4,2,i+2);
    plot(decmp);
    ylabel(['d',num2str(7-i)]);
end
