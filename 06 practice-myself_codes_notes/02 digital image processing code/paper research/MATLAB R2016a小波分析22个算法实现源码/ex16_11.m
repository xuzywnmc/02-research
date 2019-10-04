% 当前延拓模式是补零
% 装载一维原始
load leleccum;s=leleccum(1:3920);ls=length(s);
% 使用db5进行尺度为3时的分解
[c,l]=wavedec(s,3,'db5');
% 从小波分解结构[c,l]重构信号s
a0=waverec(c,l,'db5');
% 检查重构效果
err=norm(s-a0);
subplot(2,1,1);plot(s);title('原始信号')
subplot(2,1,2);plot(a0);title('重构信号')
