function [Xk]=dfs(xn,N)
% 计算离散Fourier序列的系数
% 调用方式：[Xk]=dfs(xn,N)
% Xk：离散Fourier变换的系数，序号：0<=k<=N-1
% xn：取周期信号的一个周期，序号：0<=k<=N-1
% N：xn的数据个数
n=[0:1:N-1];            % 数据数组序列
k=[0:1:N-1];            % 频率数组序列
WN=exp(-j*2*pi/N);      % Wn因子
nk=n'*k;                % 产生N*N的矩阵nk
WNnk=WN.^nk;            % 离散Fourier变换矩阵
Xk=xn*WNnk;             % Fourier变换系数
