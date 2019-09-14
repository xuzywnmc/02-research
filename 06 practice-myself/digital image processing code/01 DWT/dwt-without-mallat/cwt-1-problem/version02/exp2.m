%exp1.m
clc;
clear;

load data;
plot(dat)   %画出原信号f(t)
xlabel('t')
ylabel('f(t)')
title('原信号f(t)')
 
x=-5:0.1:5
plot(x,psi(x))   %画出小波母函数Ψ(t)
xlabel('t')
ylabel('Ψ(t)')
title('小波母函数')

len=length(dat);  
lena=70;   %尺度a在0到70之间
a=zeros(1,lena);
wavefactor=zeros(lena,len);   %定义小波系数矩阵
%说明小波系数矩阵宽度是70 长度是数据长度1280
diswavefactor=zeros(1,len);   %定义离散化小波系数矩阵

for i=1:lena   %i为尺度因子

    for j=1:len
        diswavefactor(j)=psi(j/i);
        %先计算
    end
    for k=1:len   %k为平移因子
        wavefactor(i,k)=(sum(diswavefactor.*dat))/sqrt(i);   %求小波系数
        diswavefactor=[psi(-1*k/i),diswavefactor(1:len-1)];
    end
end

image(wavefactor)
colormap
xlabel('位移因子')
ylabel('尺度因子')
title('连续小波变换结果')

