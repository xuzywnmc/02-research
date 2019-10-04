 clear all;
%由5个正弦信号合成一个信号
f1=450;f21=300;f22=100;f3=210;f4=250;f5=160;
Fs=1000;
for i=1:Fs+1
    t(i)=(i-1)/Fs;
    if 0.25<t(i)&t(i)<=0.5
        Ut1=1;
    else Ut1=0;
    end
    if 0.5<t(i)&t(i)<=0.75
        Ut2=1;
    else Ut2=0;
    end
    if 0.75<t(i)&t(i)<=1
        Ut3=1;
    else Ut3=0;
    end
    if 0<t(i)&t(i)<=0.25
        Ut4=1;
    else Ut4=0;
    end
    x1(i)=sin(2*pi*f1*t(i));
    x2(i)=(sin(2*pi*f21*t(i)))*Ut1;
    x3(i)=5*sin(2*pi*f3*t(i))*Ut2;
    x4(i)=sin(2*pi*f4*t(i))*Ut3;
    x5(i)=sin(2*pi*f5*t(i))*Ut4;
end
%绘制合成信号
subplot(611);plot(t,x1);
xlabel('时间');ylabel('x1');
subplot(612);plot(t,x1);
xlabel('时间');ylabel('x2');
subplot(613);plot(t,x3);
xlabel('时间');ylabel('x3');
subplot(614);plot(t,x4);
xlabel('时间');ylabel('x4');
subplot(615);plot(t,x5);
xlabel('时间');ylabel('x5');
x=x1+x2+x3+x4+x5;
subplot(616);plot(t,x);
xlabel('时间');ylabel('x');
