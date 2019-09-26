clear all; close all; clc;
img=double(imread('lena512.bmp'));
%%
%测试1 ledec pfilter = 'pkva' ; 输出到底什么
%%
%     [h, g] = pfilters('pkva');
%         % Laplacian decomposition
%         [xlo, xhi] = lpdec(img, h, g);
% lpdec Output: 
%   c:      coarse image at half size
%   d:      detail image at full size
%%
% G_LOWER=double(img);
% G_LOWER1=G_LOWER(1:2:end,1:2:end)
% flag=1:3
%%
%%测试滤波器符号反转频谱变化
t=[1 2 3 4]
h=[0.4 0.8 -0.3 0.1];
% x_hat=fft(h);
% subplot(331)
% stem(t, abs(x_hat));
% title('h'),xlabel('time'),ylabel('amplitude')
% 

h2=h;
x_hat=fft(h2);
subplot(331)
stem(t, log(x_hat));
title('h'),xlabel('time'),ylabel('频谱')

subplot(332)
stem(t, log(angle(x_hat)*180/pi));
title('h'),xlabel('time'),ylabel('相位谱')

subplot(333)
abs1=log(abs(x_hat))
stem(t, abs1);
title('h'),xlabel('time'),ylabel('幅度谱')



h2=-h;
x_hat=fft(h2);
subplot(334)
stem(t, log(x_hat));
title('-h'),xlabel('time'),ylabel('频谱')

subplot(335)
stem(t, log(angle(x_hat)*180/pi));
title('-h'),xlabel('time'),ylabel('相位谱')

subplot(336)
abs1=log(abs(x_hat))
stem(t, abs1);
title('-h'),xlabel('time'),ylabel('幅度谱')

%img=double(img);
%-----------------------------------------------------------------
%%测试二维图像的频谱
% f=fft2(img);        %傅里叶变换
% f=fftshift(f);      %使图像对称
% r=real(f);          %图像频域实部
% i=imag(f);          %图像频域虚部
% margin=log(abs(f));      %图像幅度谱，加log便于显示
% phase=log(angle(f)*180/pi);     %图像相位谱
% l=log(f);           
% subplot(2,2,1),imshow(img,[]),title('源图像');
% subplot(2,2,2),imshow(l,[]),title('图像频谱');
% subplot(2,2,3),imshow(margin,[]),title('图像幅度谱');
% subplot(2,2,4),imshow(phase,[]),title('图像相位谱');
%%
%-------------------------------------------------------------
%%测试低通滤波器
% fs=2000;
% t=(1:fs)/fs;
% ff1=100;
% ff2=400;
% x=sin(2*pi*ff1*t)+sin(2*pi*ff2*t);
% %lowp(300,350,0.1,20,fs);
% figure
% plot(t,x)
% f1=300;
% f3=350;
% rp=0.1;rs=20;
% Fs=fs;
% %低通滤波
% %使用注意事项：通带或阻带的截止频率的选取范围是不能超过采样率的一半
% %即，f1,f3的值都要小于 Fs/2
% %x:需要带通滤波的序列
% % f 1：通带截止频率
% % f 3：阻带截止频率
% %rp：边带区衰减DB数设置
% %rs：截止区衰减DB数设置
% %FS：序列x的采样频率
% % rp=0.1;rs=30;%通带边衰减DB值和阻带边衰减DB值
% % Fs=2000;%采样率
% %
% wp=2*pi*f1/Fs;
% ws=2*pi*f3/Fs;
% % 设计切比雪夫滤波器；
% [n,wn]=cheb1ord(wp/pi,ws/pi,rp,rs);
% [bz1,az1]=cheby1(n,rp,wp/pi);
% %查看设计滤波器的曲线
% [h,w]=freqz(bz1,az1,256,Fs);
% h=20*log10(abs(h));
% figure;plot(w,h);title('所设计滤波器的通带曲线');grid on;
% y=filter(bz1,az1,x);%对序列x滤波后得到的序列y
% figure;
% plot(t,y);
% %
% %y=filter(bz1,az1,x);%对序列x滤波后得到的序列y
% % figure;
% % subplot(211);plot(t,y);