% 使用随机函数产生一维信号 
clc;clear
wname='db3';
randn('seed',531316785);
s=2+kron(ones(1,8),[1 -1])+((1:16).^2)/32+0.2*randn(1,16);
figure;
plot(s);title('(a) 原始图像');
