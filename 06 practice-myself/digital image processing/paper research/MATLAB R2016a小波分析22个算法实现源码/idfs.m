function [xn]=idfs(Xk,N)
% 计算离散Fourier逆变换
% 调用方式：[xn]=idfs(Xk,N)
% xn：输出的Fourier逆变换后的序列，序号：0<=n=<N-1
% Xk：输入数组，序号：0<=n=<N-1
% N：Xk的元素个数
n=[0:1:N-1];            % 数据数组序列
k=[0:1:N-1];            % 频率数组序列
WN=exp(-j*2*pi/N);     % Wn因子
nk=n'*k;               % 产生N*N的矩阵nk
WNnk=WN.^(-nk);        % 离散Fourier变换矩阵
xn=(Xk*WNnk)/N;          % Fourier变换系数
