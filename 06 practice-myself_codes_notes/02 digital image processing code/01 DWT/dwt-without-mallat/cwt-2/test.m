% %������������Ƶ��
% fb = 1.5; fc = 1;
% % ������Ч֧�ź�����
% lb = -8; ub = 8; n = 1000;
% % ���㸴MorletС��cmor1.5-1
% [psi,x] = cmorwavf(lb,ub,n,fb,fc);
% % ������MorletС��
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
% �����ź���Ϣ
fs=2^6;    %����Ƶ��
dt=1/fs;    %ʱ�侫��
timestart=-8;
timeend=8;
t=(0:(timeend-timestart)/dt-1)*dt+timestart;
L=length(t);

z=4*sin(2*pi*linspace(6,12,L).*t);
%�ɰ汾
wavename='cmor1-3'; %�ɱ�������ֱ�Ϊcmor��
%��һ��Ƶ��ת�߶ȵ�����
fmin=2;
fmax=20;
df=0.1;

f=fmin:df:fmax-df;%Ԥ�ڵ�Ƶ��
wcf=centfrq(wavename); %С��������Ƶ��
scal=fs*wcf./f;%����Ƶ��ת���߶�
coefs = cwt(z,scal,wavename);
figure(2)
pcolor(t,f,abs(coefs));shading interp
