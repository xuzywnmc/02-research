fs=2^6;    %����Ƶ��
dt=1/fs;    %ʱ�侫��
timestart=0;
timeend=8;
t=(0:(timeend-timestart)/dt-1)*dt+timestart;
L=length(t);
z=4*sin(2*pi*linspace(6,12,L).*t);
%z=4*sin(2*pi*t);
%������㷶Χ�;���
fmin=2;
fmax=20;
df=0.1;
totalscal=(fmax-fmin)/df;
f=fmin:df:fmax-df;%Ԥ�ڵ�Ƶ��
%****************************
% wavename=psi(t);
% plot(wavename);
% %****************************
%wcf=centfrq(wavename); %С��������Ƶ��
scal=fs*3./f;

%�Լ�ʵ�ֵ�С������
coefs2=cwt_cmor(z,1,3,f,fs);
figure(3)
pcolor(t,f,abs(coefs2));shading interp

% 
