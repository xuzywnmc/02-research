load hns.dat ;                           %读取数据序列
Xt=hns;                                 %把数据赋值给变量
Fs=50;                                   %设定采样率 单位(Hz)
dt=1/Fs;                                 %求采样间隔 单位(s)
N=length(Xt);                            %得到序列的长度
Xf=fft(Xt);                              %对信号进行快速Fourier变换(FFT)

figure(1)
subplot(2,1,1),plot([0:N-1]/Fs,Xt);        %绘制原始值序列
xlabel('时间/s'),title('时间域');
grid on;

subplot(2,1,2),plot([0:N-1]/(N*dt),abs(Xf)*2/N);%绘制信号的振幅谱
xlabel('频率/Hz'),title('幅频图');
ylabel('振幅');
xlim([0 2]);           %频率轴只画出2Hz频率之前的部分
grid on;


figure(2)
load hns1.dat ;                           %读取数据序列
Xt=hns1;                                 %把数据赋值给变量
Fs=50;                                   %设定采样率 单位(Hz)
dt=1/Fs;                                 %求采样间隔 单位(s)
N=length(Xt);                            %得到序列的长度
Xf=fft(Xt);                              %对信号进行快速Fourier变换(FFT)

subplot(2,1,1),plot([0:N-1]/Fs,Xt);        %绘制原始值序列
xlabel('时间/s'),title('时间域');
grid on;

subplot(2,1,2),plot([0:N-1]/(N*dt),abs(Xf)*2/N);%绘制信号的振幅谱
xlabel('频率/Hz'),title('幅频图');
ylabel(' 振幅');
xlim([0 2]);                          %频率轴只画出2Hz频率之前的部分
grid on;

figure(3)
load hns2.dat ;                           %读取数据序列
Xt=hns2;                                 %把数据赋值给变量
Fs=50;                                   %设定采样率 单位(Hz)
dt=1/Fs;                                 %求采样间隔 单位(s)
N=length(Xt);                            %得到序列的长度
Xf=fft(Xt);                              %对信号进行快速Fourier变换(FFT)

subplot(2,1,1),plot([0:N-1]/Fs,Xt);        %绘制原始值序列
xlabel('时间/s'),title('时间域');
grid on;

subplot(2,1,2),plot([0:N-1]/(N*dt),abs(Xf)*2/N);%绘制信号的振幅谱
xlabel('频率/Hz'),title('幅频图');
ylabel('振幅');
xlim([0 2]);                          %频率轴只画出2Hz之前的部分
grid on;

figure(4)
load hns3.dat ;                           %读取数据序列
Xt=hns3;                                 %把数据赋值给变量
Fs=50;                                   %设定采样率 单位(Hz)
dt=1/Fs;                                 %求采样间隔 单位(s)
N=length(Xt);                            %得到序列的长度
Xf=fft(Xt);                              %对信号进行快速Fourier变换(FFT)

subplot(2,1,1),plot([0:N-1]/Fs,Xt);        %绘制原始值序列
xlabel('时间/s'),title('时间域');
grid on;

subplot(2,1,2),plot([0:N-1]/(N*dt),abs(Xf)*2/N);%绘制信号的振幅谱
xlabel('频率/Hz'),title('幅频图');
ylabel('振幅');
xlim([0 2]);                          %频率轴只画出2Hz频率之前的部分
grid on;
