fs=2^6;    %采样频率
dt=1/fs;    %时间精度
timestart=0;
timeend=8;
t=(0:(timeend-timestart)/dt-1)*dt+timestart;
L=length(t);
z=4*sin(2*pi*linspace(6,12,L).*t);
%z=4*sin(2*pi*t);
%定义计算范围和精度
fmin=2;
fmax=20;
df=0.1;
totalscal=(fmax-fmin)/df;
f=fmin:df:fmax-df;%预期的频率
%****************************
% wavename=psi(t);
% plot(wavename);
% %****************************
%wcf=centfrq(wavename); %小波的中心频率
scal=fs*3./f;

%自己实现的小波函数
coefs2=cwt_cmor(z,1,3,f,fs);
figure(3)
pcolor(t,f,abs(coefs2));shading interp

% 
