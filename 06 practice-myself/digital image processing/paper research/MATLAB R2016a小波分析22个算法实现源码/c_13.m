N=100; dt=0.01;   %数据点数和采样间隔
n=0:N-1; t=n*dt;   %时间序列
f=n/(N*dt);     %频率序列
h=[1 zeros(1,N-1)];  %脉冲信号第一个值为1，其余为零
fo=2;f1=10;          % 频率渐增函数鸟鸣信号从2Hz增加到10Hz
x=chirp(t,fo,1,f1);    %在时间序列t上产生频率渐增信号—鸟鸣信号
xh=conv(x,h);    %将鸟鸣信号和脉冲信号进行卷积，参看上面的用法
XH=dfs(xh(1:N),N);  %由于卷积后数据变长，这里只选取与原数据长度相等的数据个数
subplot(2,2,1),plot(f,real(XH)*2/N); %绘出卷积后Fourier变换的实部
xlabel('频率/Hz');title('信号卷积后Fourier变换XH的实部');
subplot(2,2,2),plot(f,imag(XH)*2/N); %绘出卷积后Fourier变换的虚部
xlabel('频率/Hz');title('信号卷积后Fourier变换XH的虚部');
X=dfs(x,N);  %对chirp信号进行Fourier变换
H=dfs(h,N);   %对脉冲信号进行Fourier变换
XH1=X.*H;   %对鸟鸣信号和脉冲信号的Fourier变换相乘
subplot(2,2,3),plot(f,real(XH1)*2/N); %绘出Fourier变换后乘积的实部
xlabel('频率/Hz');title(' 频率域乘积XH1的实部')
subplot(2,2,4),plot(f,imag(XH1)*2/N); %绘出Fourier变换后乘积的虚部
xlabel('频率/Hz');title(' 频率域乘积XH1的虚部');
