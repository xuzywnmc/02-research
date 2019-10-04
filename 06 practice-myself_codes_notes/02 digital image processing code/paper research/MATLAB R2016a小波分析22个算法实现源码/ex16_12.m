load sumsin;s=sumsin;
subplot(211);plot(s);title('原始信号');
% 使用sym4进行尺度为5的分解
[c,l]=wavedec(s,5,'sym4');
% 从小波分解结构[C,L]，重构尺度为5的低频部分
a5=wrcoef('a',c,l,'sym4',5);
subplot(212);plot(a5);title('重构低频信号');
