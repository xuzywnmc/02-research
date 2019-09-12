fs=2^6;    %����Ƶ��
dt=1/fs;    %ʱ�侫��
timestart=-140;
timeend=140;
t=(0:(timeend-timestart)/dt-1)*dt+timestart;
L=length(t);

z=4*sin(2*pi*linspace(6,12,L).*t);

% z=sin(20*t);
% fli= fft(z)
% f2= (0:length(fli)-1)*50/length(fli);
% figure('NumberTitle', 'off', 'Name', 'ԭ��������Ҷ�任���');
% plot(f2,abs(fli))
%������㷶Χ�;���
fmin=2;
fmax=20;
df=0.1;
totalscal=(fmax-fmin)/df;
f=fmin:df:fmax-df;%Ԥ�ڵ�Ƶ��
%wcf=centfrq(wavename); %С��������Ƶ��
scal=fs*3./f;
%�Լ�ʵ�ֵ�С������
%�����Ǻ���
%1 С���Ĺ�һ�ź�׼��
z=z(:)';%ǿ�б��y����������ǰ�����
L=length(z);
%2 ����߶�
scal=fs*3./f;
%3����С��
shuaijian=0.001;%ȡС��˥������Ϊ1%
tlow2low=sqrt(1*log(1/shuaijian));%����cmor˥����1%ʱ��ʱ�䳤�ȣ��ҽ�cmor�ı��ʽ
%3С���Ļ��ֺ���
iter=10;%С�����������仮�־���
xWAV=linspace(-tlow2low,tlow2low,2^iter);
stepWAV = xWAV(2)-xWAV(1);
val_WAV=cumsum(cmorwavf(-tlow2low,tlow2low,2^iter,1,3))*stepWAV;
% figure(99);
% plot(val_WAV);
% %���ǰ׼��
xWAV = xWAV-xWAV(1);
 xMaxWAV = xWAV(end);
coefs     = zeros(length(scal),L);%Ԥ����coefs
%4С�����źŵľ��
for k = 1:length(scal)   %һ��scalһ��
     a_SIG = scal(k); %a����һ�еĳ߶Ⱥ���
    j = 1+floor((0:a_SIG*xMaxWAV)/(a_SIG*stepWAV));
%         %j�����ֵΪ��ȷ���ģ��߶�Խ�󣬻��ֵ�Խ�ܡ��൱�ڰ�һ��С�������Խ����
%     if length(j)==1 , j = [1 1];
%         
   % end
    waveinscal = fliplr(val_WAV(j));%�ѻ���ֵ��չ��j���䣬Ȼ�����ҵߵ���fΪ���³߶ȵĻ���С������
%     if k==100,figure(100),plot(waveinscal);end
%     figure(k);
%     plot(val_WAV(j));
    %5 ����Ҫ��һ�� wkeep1ȡdiff(wconv1(ySIG,f))�ﳤ��ΪlenSIG���м�һ��
% % % %     conv(ySIG,f)�����
    coefs(k,:) = -sqrt(a_SIG)*wkeep1(diff(conv2(z,waveinscal, 'full')),L);  
    %   C = CONV2(A, B) performs the 2-D convolution of matrices A and B.
%   If [ma,na] = size(A), [mb,nb] = size(B), and [mc,nc] = size(C), then
%   mc = max([ma+mb-1,ma,mb]) and nc = max([na+nb-1,na,nb]).
%
% % %       Y = WKEEP1(X,L,OPT) extracts the vector Y 
% % %   from the vector X. The length of Y is L.
% % %   If OPT = 'c' ('l' , 'r', respectively), Y is the central
% % %   (left, right, respectively) part of X.
%full: ��������Ϊ1��ͼƬ��СΪN1xN1������˴�СΪN2xN2��
%�����ͼ���С��N1+N2-1 x N1+N2-1
    %
end
% %coefs2=cwt_cmor(z,1,3,f,fs);
% figure;
% pcolor(t,f,abs(coefs));shading interp��
%%
figure('NumberTitle', 'off', 'Name', '���߱�д��С���任���');
pcolor(t,f,abs(coefs));shading interp
% pcolor(t,f,abs(coefs));shading interp
%����С���任���
figure('NumberTitle', 'off', 'Name', '����cwt�������');
[wt,f1,coi] = cwt(z,scal,'amor',fs);
pcolor(t,f1,abs(wt));shading interp
%%�������߱�д����άͼ���
x=t;
y=f;
z=abs(coefs);
figure('NumberTitle', 'off', 'Name', '�������߱�д����άͼ���');
mesh(x,y,z)
xlabel('time');
ylabel('scale');
zlabel('amplitude');
%%
%%�������߱�д����άͼ���
x=t;
y=f1;
z=abs(wt);
figure('NumberTitle', 'off', 'Name', '����cwt��άͼ���');
mesh(x,y,z)
xlabel('time');
ylabel('scale');
zlabel('amplitude');
%%
%% ����ɾ�� ����������άͼ
% x=[16 17.5 19 21 22 23.7];
% y=[3 6 9 10 12];
% z=[ 0.08 0.09 0.09 0.1 0.11 0.11;
% 0.04 0.05 0.06 0.08 0.1 0.15;
% 0.02 0.05 0.12 0.19 0.27 0.44;
% 0.03 0.06 0.2 0.35 0.46 0.62;
% 0.32 0.45 0.84 0.88 0.94 1.17];
% figure;
% mesh(x,y,z); %�����Ա�����һ�������
% xlabel('�Ա���1');
% ylabel('�Ա���2');
% zlabel('�����Z');
%,