clear all;
x=linspace(0,10,1000);
y=25*exp(-(x-5.7).^2/(2*0.5*2))+30*exp(-(x-4.3).^2/(2*0.3^2)/(2*0.3^2))+...
    20*exp(-(x-3.6).^2/(2*0.2^2))+18*exp(-(x-3.0).^2/(2*0.3^2));     %原始信号模拟
[c,l]=wavedec(y,7,'sym6');
d7=wrcoef('d',c,l,'sym6',7);
d6=wrcoef('d',c,l,'sym6',6);
d5=wrcoef('d',c,l,'sym6',5);
figure;
plot(x,y,'o');
xlabel('时间');ylabel('幅值');
axis([0 10 0 40])
figure;
subplot(4,1,1);plot(x,y);
xlabel('(a)原始信号');
subplot(4,1,2);plot(d5);
xlabel('(b)d5信号')
subplot(4,1,3);plot(d6);
xlabel('(c)d6信号')
subplot(4,1,4);plot(d7);
xlabel('(d)d7信号')
