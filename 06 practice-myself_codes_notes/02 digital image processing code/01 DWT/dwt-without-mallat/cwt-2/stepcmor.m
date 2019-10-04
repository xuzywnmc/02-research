fs=2^6;    %采样频率
dt=1/fs;    %时间精度
timestart=-140;
timeend=140;
t=(0:(timeend-timestart)/dt-1)*dt+timestart;
L=length(t);

z=4*sin(2*pi*linspace(6,12,L).*t);

% z=sin(20*t);
% fli= fft(z)
% f2= (0:length(fli)-1)*50/length(fli);
% figure('NumberTitle', 'off', 'Name', '原函数傅里叶变换结果');
% plot(f2,abs(fli))
%定义计算范围和精度
fmin=2;
fmax=20;
df=0.1;
totalscal=(fmax-fmin)/df;
f=fmin:df:fmax-df;%预期的频率
%wcf=centfrq(wavename); %小波的中心频率
scal=fs*3./f;
%自己实现的小波函数
%后面是函数
%1 小波的归一信号准备
z=z(:)';%强行变成y向量，避免前面出错
L=length(z);
%2 计算尺度
scal=fs*3./f;
%3计算小波
shuaijian=0.001;%取小波衰减长度为1%
tlow2low=sqrt(1*log(1/shuaijian));%单边cmor衰减至1%时的时间长度，惨叫cmor的表达式
%3小波的积分函数
iter=10;%小波函数的区间划分精度
xWAV=linspace(-tlow2low,tlow2low,2^iter);
stepWAV = xWAV(2)-xWAV(1);
val_WAV=cumsum(cmorwavf(-tlow2low,tlow2low,2^iter,1,3))*stepWAV;
% figure(99);
% plot(val_WAV);
% %卷积前准备
xWAV = xWAV-xWAV(1);
 xMaxWAV = xWAV(end);
coefs     = zeros(length(scal),L);%预初设coefs
%4小波与信号的卷积
for k = 1:length(scal)   %一个scal一行
     a_SIG = scal(k); %a是这一行的尺度函数
    j = 1+floor((0:a_SIG*xMaxWAV)/(a_SIG*stepWAV));
%         %j的最大值为是确定的，尺度越大，划分的越密。相当于把一个小波拉伸的越长。
%     if length(j)==1 , j = [1 1];
%         
   % end
    waveinscal = fliplr(val_WAV(j));%把积分值扩展到j区间，然后左右颠倒。f为当下尺度的积分小波函数
%     if k==100,figure(100),plot(waveinscal);end
%     figure(k);
%     plot(val_WAV(j));
    %5 最重要的一步 wkeep1取diff(wconv1(ySIG,f))里长度为lenSIG的中间一段
% % % %     conv(ySIG,f)卷积。
    coefs(k,:) = -sqrt(a_SIG)*wkeep1(diff(conv2(z,waveinscal, 'full')),L);  
    %   C = CONV2(A, B) performs the 2-D convolution of matrices A and B.
%   If [ma,na] = size(A), [mb,nb] = size(B), and [mc,nc] = size(C), then
%   mc = max([ma+mb-1,ma,mb]) and nc = max([na+nb-1,na,nb]).
%
% % %       Y = WKEEP1(X,L,OPT) extracts the vector Y 
% % %   from the vector X. The length of Y is L.
% % %   If OPT = 'c' ('l' , 'r', respectively), Y is the central
% % %   (left, right, respectively) part of X.
%full: 滑动步长为1，图片大小为N1xN1，卷积核大小为N2xN2，
%卷积后图像大小：N1+N2-1 x N1+N2-1
    %
end
% %coefs2=cwt_cmor(z,1,3,f,fs);
% figure;
% pcolor(t,f,abs(coefs));shading interp、
%%
figure('NumberTitle', 'off', 'Name', '作者编写的小波变换结果');
pcolor(t,f,abs(coefs));shading interp
% pcolor(t,f,abs(coefs));shading interp
%快速小波变换结果
figure('NumberTitle', 'off', 'Name', '基于cwt函数结果');
[wt,f1,coi] = cwt(z,scal,'amor',fs);
pcolor(t,f1,abs(wt));shading interp
%%基于作者编写的三维图结果
x=t;
y=f;
z=abs(coefs);
figure('NumberTitle', 'off', 'Name', '基于作者编写的三维图结果');
mesh(x,y,z)
xlabel('time');
ylabel('scale');
zlabel('amplitude');
%%
%%基于作者编写的三维图结果
x=t;
y=f1;
z=abs(wt);
figure('NumberTitle', 'off', 'Name', '基于cwt三维图结果');
mesh(x,y,z)
xlabel('time');
ylabel('scale');
zlabel('amplitude');
%%
%% 请勿删除 用来测试三维图
% x=[16 17.5 19 21 22 23.7];
% y=[3 6 9 10 12];
% z=[ 0.08 0.09 0.09 0.1 0.11 0.11;
% 0.04 0.05 0.06 0.08 0.1 0.15;
% 0.02 0.05 0.12 0.19 0.27 0.44;
% 0.03 0.06 0.2 0.35 0.46 0.62;
% 0.32 0.45 0.84 0.88 0.94 1.17];
% figure;
% mesh(x,y,z); %两个自变量，一个因变量
% xlabel('自变量1');
% ylabel('自变量2');
% zlabel('因变量Z');
%,