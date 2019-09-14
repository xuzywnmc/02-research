function y=cirshftt(n,m,N)
% 对N个数据x循环移位m个单位采样
% 调用形式：[y]=cirshftt(x,m,N)
% y：循环移位后的输出序列
% x：输入序列
% m：移位的采样单位数
% N：输入序列的大小
if length(x)>N
    error('N must be>=the length of x')
end
x=[x zeros(1,N-length(x))];
n=[0:1:N-1];
n=mod(n-m,N);
y=x(n+1);
