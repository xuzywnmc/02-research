clear all; close all; clc;
img=double(imread('lena512.bmp'));
%%
%����1 ledec pfilter = 'pkva' ; �������ʲô
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
%%�����˲������ŷ�תƵ�ױ仯
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
title('h'),xlabel('time'),ylabel('Ƶ��')

subplot(332)
stem(t, log(angle(x_hat)*180/pi));
title('h'),xlabel('time'),ylabel('��λ��')

subplot(333)
abs1=log(abs(x_hat))
stem(t, abs1);
title('h'),xlabel('time'),ylabel('������')



h2=-h;
x_hat=fft(h2);
subplot(334)
stem(t, log(x_hat));
title('-h'),xlabel('time'),ylabel('Ƶ��')

subplot(335)
stem(t, log(angle(x_hat)*180/pi));
title('-h'),xlabel('time'),ylabel('��λ��')

subplot(336)
abs1=log(abs(x_hat))
stem(t, abs1);
title('-h'),xlabel('time'),ylabel('������')

%img=double(img);
%-----------------------------------------------------------------
%%���Զ�άͼ���Ƶ��
% f=fft2(img);        %����Ҷ�任
% f=fftshift(f);      %ʹͼ��Գ�
% r=real(f);          %ͼ��Ƶ��ʵ��
% i=imag(f);          %ͼ��Ƶ���鲿
% margin=log(abs(f));      %ͼ������ף���log������ʾ
% phase=log(angle(f)*180/pi);     %ͼ����λ��
% l=log(f);           
% subplot(2,2,1),imshow(img,[]),title('Դͼ��');
% subplot(2,2,2),imshow(l,[]),title('ͼ��Ƶ��');
% subplot(2,2,3),imshow(margin,[]),title('ͼ�������');
% subplot(2,2,4),imshow(phase,[]),title('ͼ����λ��');
%%
%-------------------------------------------------------------
%%���Ե�ͨ�˲���
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
% %��ͨ�˲�
% %ʹ��ע�����ͨ��������Ľ�ֹƵ�ʵ�ѡȡ��Χ�ǲ��ܳ��������ʵ�һ��
% %����f1,f3��ֵ��ҪС�� Fs/2
% %x:��Ҫ��ͨ�˲�������
% % f 1��ͨ����ֹƵ��
% % f 3�������ֹƵ��
% %rp���ߴ���˥��DB������
% %rs����ֹ��˥��DB������
% %FS������x�Ĳ���Ƶ��
% % rp=0.1;rs=30;%ͨ����˥��DBֵ�������˥��DBֵ
% % Fs=2000;%������
% %
% wp=2*pi*f1/Fs;
% ws=2*pi*f3/Fs;
% % ����б�ѩ���˲�����
% [n,wn]=cheb1ord(wp/pi,ws/pi,rp,rs);
% [bz1,az1]=cheby1(n,rp,wp/pi);
% %�鿴����˲���������
% [h,w]=freqz(bz1,az1,256,Fs);
% h=20*log10(abs(h));
% figure;plot(w,h);title('������˲�����ͨ������');grid on;
% y=filter(bz1,az1,x);%������x�˲���õ�������y
% figure;
% plot(t,y);
% %
% %y=filter(bz1,az1,x);%������x�˲���õ�������y
% % figure;
% % subplot(211);plot(t,y);