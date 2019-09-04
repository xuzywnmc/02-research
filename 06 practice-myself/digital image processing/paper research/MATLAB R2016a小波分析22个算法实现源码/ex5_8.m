%生成正弦信号
N=1000;
t=1:N;
sig1=sin(0.3*t);
%生成三角波信号
sig2(1:500)=((1:500)-1)/500;
sig2(501:N)=(1000-(501:1000))/500;
figure(1);
subplot(2,1,1);
plot(t,sig1,'LineWidth',2);
xlabel('样本序号 n');
ylabel('幅值 A');
subplot(2,1,2);
plot(t,sig2,'LineWidth',2);
xlabel('样本序号 n');
ylabel('幅值 A');
%叠加信号
x=sig1+sig2+randn(1,N);
figure(2)
plot(t,x,'LineWidth',2);
xlabel('样本序号 n');
ylabel('幅值 A');
%一维小波分解
[c,l] = wavedec(x,7,'db5');

%重构第1-7层逼近系数.
a7 = wrcoef('a',c,l,'db5',7);
a6 = wrcoef('a',c,l,'db5',6);
a5 = wrcoef('a',c,l,'db5',5);
a4 = wrcoef('a',c,l,'db5',4);
a3 = wrcoef('a',c,l,'db5',3);
a2 = wrcoef('a',c,l,'db5',2);
a1 = wrcoef('a',c,l,'db5',1);

%显示逼近系数
figure(3)
subplot(7,1,1);
plot(a7,'LineWidth',2);
ylabel('a7');
subplot(7,1,2);
plot(a6,'LineWidth',2);
ylabel('a6');
subplot(7,1,3);
plot(a5,'LineWidth',2);
ylabel('a5');
subplot(7,1,4);
plot(a4,'LineWidth',2);
ylabel('a4');
subplot(7,1,5);
plot(a3,'LineWidth',2);
ylabel('a3');
subplot(7,1,6);
plot(a2,'LineWidth',2);
ylabel('a2');
subplot(7,1,7);
plot(a1,'LineWidth',2);
ylabel('a1');
xlabel('样本序号 n');

%重构第1-7层细节系数
d7 = wrcoef('d',c,l,'db5',7);
d6 = wrcoef('d',c,l,'db5',6);
d5 = wrcoef('d',c,l,'db5',5);
d4 = wrcoef('d',c,l,'db5',4);
d3 = wrcoef('d',c,l,'db5',3);
d2 = wrcoef('d',c,l,'db5',2);
d1 = wrcoef('d',c,l,'db5',1);
%显示细节系数
figure(4)
subplot(7,1,1);
plot(d7,'LineWidth',2);
ylabel('d7');
subplot(7,1,2);
plot(d6,'LineWidth',2);
ylabel('d6');
subplot(7,1,3);
plot(d5,'LineWidth',2);
ylabel('d5');
subplot(7,1,4);
plot(d4,'LineWidth',2);
ylabel('d4');
subplot(7,1,5);
plot(d3,'LineWidth',2);
ylabel('d3');
subplot(7,1,6);
plot(d2,'LineWidth',2);
ylabel('d2');
subplot(7,1,7);
plot(d1,'LineWidth',2);
ylabel('d1');
xlabel('样本序号 n');
