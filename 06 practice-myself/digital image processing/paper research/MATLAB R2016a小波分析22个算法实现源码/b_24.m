 clear all;
t = 0:0.5:10;    % 时间限制
s = 0.05+i;      % 旋转率
Z = exp(-s*t);   % 计算衰减指数
feather(Z)      %羽毛图
