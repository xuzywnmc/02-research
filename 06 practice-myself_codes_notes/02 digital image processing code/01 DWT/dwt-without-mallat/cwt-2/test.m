% %定义带宽和中心频率
% fb = 1.5; fc = 1;
% % 设置有效支撑和网格
% lb = -8; ub = 8; n = 1000;
% % 计算复Morlet小波cmor1.5-1
% [psi,x] = cmorwavf(lb,ub,n,fb,fc);
% % 画出复Morlet小波
% figure;
% plot(psi);
% a=[1,2,3,4,5,6,7,8,9];
% b=cumsum(a);
% y = wkeep1(a,5)
% wavename=mexihat(-5,5,1024)
% %[psi,xval]=wavefun('mexihat',8);
% %[PHI,PSI,XVAL] = wavefun('Morlet',8)
% %wcf=centfrq('dummy')
% cfreq = centfrq('meyr');
% %plot(sym4);
% figure;
% plot(wavename);
% x=0:0.1:30;
% tt=sin(2*pi*x);
% figure;
% plot(tt);
% tt=sin((2/5)*pi*x);
% figure;
% plot(tt);
% 定义信号信息
fs=2^6;    %采样频率
dt=1/fs;    %时间精度
timestart=-8;
timeend=8;
t=(0:(timeend-timestart)/dt-1)*dt+timestart;
L=length(t);

z=4*sin(2*pi*linspace(6,12,L).*t);
%旧版本
wavename='cmor1-3'; %可变参数，分别为cmor的
%举一个频率转尺度的例子
fmin=2;
fmax=20;
df=0.1;

f=fmin:df:fmax-df;%预期的频率
wcf=centfrq(wavename); %小波的中心频率
scal=fs*wcf./f;%利用频率转换尺度
coefs = cwt(z,scal,wavename);
figure(2)
pcolor(t,f,abs(coefs));shading interp
