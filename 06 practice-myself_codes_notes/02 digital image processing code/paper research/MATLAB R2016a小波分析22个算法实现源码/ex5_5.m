%设置信噪比和随机种子值
snr=4;
init=2055615866;
%产生原始信号sref和被高斯白噪声污染的信号s
[sref,s]=wnoise(1,11,snr,init);

%用sym8小波对信号s进行3层分解并对细节系数
%选用sure阈值模式和尺度噪声
xd=wden(s,'heursure','s','one',3,'sym8');

%显示信号波形
subplot(3,1,1);
plot(sref);
xlabel('样本序号 n');
ylabel('幅值 A');
title('参考信号');
subplot(3,1,2);
plot(s);
title('含噪信号');
xlabel('样本序号 n');
ylabel('幅值 A');
subplot(3,1,3);
plot(xd);
title('消噪信号');
xlabel('样本序号 n');
ylabel('幅值 A');
