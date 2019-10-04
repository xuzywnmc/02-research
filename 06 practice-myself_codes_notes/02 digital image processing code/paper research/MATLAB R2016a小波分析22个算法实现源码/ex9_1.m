clear                              %清除以前的数据
load  nearbrk;                      %载入原始信号的波形数据
whos;                             %显示数据的基本信号
figure(1);
plot(nearbrk)
xlabel('时间');ylabel('幅值');     %自定义坐标轴
title('频率突变信号');              %自定义坐标
figure(2);
f=fft(nearbrk);                      %对信号进行傅里叶变换
plot(abs(f));                        %显示处理后的信号图像
title('傅里叶变换后的信号示意图')    %自定义标题程序运行结果如果所示。
figure(3);
[d,a]=wavedec(nearbrk,3,'db5');                %对原始信号进行3层小波分解
a3=wrcoef('a',d,a,'db5',3);                    %重构3层近似系数
d3=wrcoef('d',d,a,'db5',3);                    %重构1层～3层细节系数  
d2=wrcoef('d',d,a,'db5',2);   
d1=wrcoef('d',d,a,'db5',1);   
subplot(411);plot(a3);ylabel('近似信号a3');   %显示各层小波系数
title('小波分解后示意图');
subplot(412);plot(d3);ylabel('细节信号d3');
subplot(413);plot(d2);ylabel('细节信号d2');
subplot(414);plot(d1);ylabel('细节信号d1');
xlabel('时间'); 
