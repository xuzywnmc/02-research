%exp1.m
clc;
clear;
fs=2^6;    %采样频率
dt=1/fs;    %时间精度
timestart=-8;
timeend=20;
t=(0:(timeend-timestart)/dt-1)*dt+timestart;
L=length(t);

dat=4*sin(2*pi*linspace(6,12,L).*t);
%load dat;
figure
plot(dat)   %画出原信号f(t)
xlabel('t')
ylabel('f(t)')
title('原信号f(t)')
 
x=-8:0.01:20;
figure
plot(x,pkk(x))   %画出小波母函数Ψ(t)
xlabel('t')
ylabel('Ψ(t)')
title('小波母函数')

len=length(dat);  
lena=70;   %尺度a在0到70之间
a=zeros(1,lena);
wavefactor=zeros(lena,len);   %定义小波系数矩阵
diswavefactor=zeros(1,len);   %定义离散化小波系数矩阵

%for i=1:lena   %i为尺度因子
for i=1:lena  %i为尺度因子
    for j=1:len
        diswavefactor(j)=pkk(j/i);
    end
    for k=1:len   %k为平移因子
        wavefactor(i,k)=(sum(diswavefactor.*dat))/sqrt(i);   %求小波系数
            for j=1:len
            diswavefactor(j)=pkk(j-k/i);
           end
          %diswavefactor=[pkk(-1*k/i),diswavefactor(1:len-1)];

    end
end
figure
image(wavefactor)
colormap
xlabel('位移因子')
ylabel('尺度因子')
title('连续小波变换结果')

