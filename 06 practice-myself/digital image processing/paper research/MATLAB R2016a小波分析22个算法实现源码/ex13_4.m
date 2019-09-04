load noispol; % 装入要分析的信号
s=noispol; ls=length(s);
[c,l]=wavedec(s,4,'db3'); % 用db3小波分解信号到第四层
figure(1);
subplot(5,1,1); plot(s);
title('原始信号及用db3小波分解其各层高频信号重构图');
ylabel('s');
% 对分解结构[c,l]中各高频部分进行重构，并显示结果
for i=1:4
    decmp=wrcoef('d',c,l,'db3',5-i);
    subplot(5,1,i+1);
    plot(decmp)
    ylabel(['d',num2str(5-i)]);
end
% 下面用db1小波进行对照分析
[c,l]=wavedec(s,4,'db1'); % 用db1小波分解信号到第四层
figure(2);
subplot(5,1,1); plot(s);
title('原始信号及用db1分解其各层高频信号重构图');
ylabel('s');
% 对分解结构[c,l]中各高频部分进行重构，并显示结果
for i=1:4
    decmp=wrcoef('d',c,l,'db1',5-i);
    subplot(5,1,i+1);
    plot(decmp);
    ylabel(['d',num2str(5-i)]);
end
