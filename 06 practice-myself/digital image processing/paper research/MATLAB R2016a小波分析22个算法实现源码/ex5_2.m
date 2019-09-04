%装载信号
load nelec;  
indx=1:1024;
x=nelec(indx);
% 用小波haar对信号进行五层分解
[c,l]=wavedec(x,5,'haar');  
% 获取信号压缩的阈值
[thr,nkeep]=ddencmp('cmp','wv',x);
% 对信号进行压缩
xd=wdencmp('gbl',c,l,'haar',5,thr,'s',1);  
subplot(2,1,1);  
plot(indx,x);  
title('原始信号');  
subplot(2,1,2);  
plot(indx,xd);  
title('压缩后的信号');
