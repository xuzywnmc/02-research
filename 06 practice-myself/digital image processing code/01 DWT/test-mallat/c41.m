%利用matlab实现小波分解与重构快速算法
%clc;clear
wname='db3';
randn('seed',531316785);
s=2+kron(ones(1,8),[1,-1])+((1:16).^2)/32+0.2*randn(1,16);
figure;
plot(s);title('(a) 原始图像');

%利用db3小波对原始信号进行二尺度分解
%使用小波分解函数dwt
[cA1,cD1]=dwt(s,wname);
figure;plot(cA1);title('(b) 近似系数cA1');
figure;plot(cD1);title('(c) 近似系数cD1');

[cA2,cD2]=dwt(cA1,wname);
figure;plot(cA2);title('(d) 近似系数cA2');
figure;plot(cD2);title('(e) 近似系数cD2');

[Lo_R,Hi_R]=wfilters(wname,'r');
ss=idwt(cA2,cD2,Lo_R,Hi_R);
sss=idwt(ss,cD1,Lo_R,Hi_R);
%计算机重构信号与原始信号的误差
err=norm(s-sss)
figure;plot(sss);title('(f) 重构的原始信号');
xlabel(['相对误差=',num2str(err)]);