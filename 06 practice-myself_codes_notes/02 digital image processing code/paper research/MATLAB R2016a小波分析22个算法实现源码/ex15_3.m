%生成线性信号
y=linspace(-1,1,100);  
%设置T阈值
thr=0.4;
%计算软、硬阈值
ythard=wthresh(y,'h',thr);  
ytsoft=wthresh(y,'s',thr);
%显示不同阈值后的信号
subplot(1,3,1);  
plot(y); 
title('原始信号');
xlabel('样本序号 n');
ylabel('幅值 A');
subplot(1,3,2);  
plot(ythard);  
title('硬阈值信号');  
xlabel('样本序号 n');
ylabel('幅值 A');
subplot(1,3,3);  
plot(ytsoft);
title('软阈值信号');
xlabel('样本序号 n');
ylabel('幅值 A');
