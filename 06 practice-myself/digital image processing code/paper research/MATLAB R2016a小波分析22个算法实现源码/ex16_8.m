% 当前扩展模式是补零模式
% 构造原始一维尺度信号
randn('seed',531316785)
s=2+kron(ones(1,8),[1,-1])+((1:16).^2)/32+0.2*randn(1,16);
% 进行单尺度离散haar小波变换
[ca1,cd1]=dwt(s,'haar');
subplot(311);plot(s);title('原始信号');
subplot(323);plot(ca1);title('haar低频系数');
subplot(324);plot(cd1);title('haar高频系数');
% 对于给定的小波，计算两个相关的分解滤波器，并直接使用该滤波器计算低频和高频系数
[Lo_D,Hi_D]=wfilters('haar','d');
[ca1,cd1]=dwt(s,Lo_D,Hi_D);
% 进行单尺度db2离散小波变换并观察最后系数的边缘效果
[ca2,cd2]=dwt(s,'db2');
subplot(325);plot(ca2);title('haar低频系数');
subplot(326);plot(cd2);title('haar高频系数');
