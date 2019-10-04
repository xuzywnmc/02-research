% 当前扩展模式是补零
% 构造原始一维信号s
randn('seed',531316785);
s=2+kron(ones(1,8),[1 -1])+((1:16).^2)/32+0.2*randn(1,16);
% 使用db2进行单尺度dwt
[ca1,cd1]=dwt(s,'db2');
subplot(221);plot(ca1);
title('db2低频系数');
subplot(222);plot(cd1);
title('db2高频系数');
% 进行单尺度离散小波逆变换
ss=idwt(ca1,cd1,'db2');
err=norm(s-ss); % 检查重构
subplot(212);plot([s;ss]');
title('原始信号和重构信号');
xlabel(['误关的2范数为=',num2str(err)])
% 对于给定的小波，计算两个相关重构滤波器，并直接利用它们进行逆变换
[Lo_R,Hi_R]=wfilters('db2','r');
ss=idwt(ca1,cd1,Lo_R,Hi_R);
