x=0:0.05:6*pi;
s=sin(x)+sin(10*x)+sin(100*x); % 产生一个正弦叠加信号
figure(1);
subplot(6,2,1);plot(s);
title('原始信号与各层低频部分');
ylabel('s');
subplot(6,2,2);plot(s);
title('原始信号与各层高频部分');
ylabel('s');
[c,l]=wavedec(s,5,'db3'); % 用db3小波分解信号到第五层
% 对分解结构[c,l]中各低频部分进行重构，并显示结果
for i=1:5
    decmp=wrcoef('a',c,l,'db3',6-i);
    subplot(6,2,2*i+1);
    plot(decmp);
    ylabel(['a',num2str(6-i)]);
end
% 对分解结构[c,l]中各高频部分进行重构，并显示结果
for i=1:5
    decmp=wrcoef('d',c,l,'db3',6-i);
    subplot(6,2,2*i+2);
    plot(decmp);
    ylabel(['d',num2str(6-i)]);
end
% 画出d1的放大波形图
figure(2);
d1=wrcoef('d',c,l,'db3',1);
subplot(411);plot(d1(1:100));
