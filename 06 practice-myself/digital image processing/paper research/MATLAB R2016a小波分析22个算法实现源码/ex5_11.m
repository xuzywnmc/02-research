%生成含噪的多项式信号
N=800;
t=1:N;
sig=t.^2-t+1;
x=sig+randn(1,N);
%一维小波分解
[c,l] = wavedec(x,4,'db3');
%[c,l] = wavedec(x,4,'db2');
%重构第1-4层逼近系数.
a4 = wrcoef('a',c,l,'db3',4);
a3 = wrcoef('a',c,l,'db3',3);
a2 = wrcoef('a',c,l,'db3',2);
a1 = wrcoef('a',c,l,'db3',1);
%显示逼近系数
figure(1)
subplot(4,1,1);
plot(a4,'LineWidth',2);
ylabel('a4');
subplot(4,1,2);
plot(a3,'LineWidth',2);
ylabel('a3');
subplot(4,1,3);
plot(a2,'LineWidth',2);
ylabel('a2');
subplot(4,1,4);
plot(a1,'LineWidth',2);
ylabel('a1');
xlabel('样本序号 n');
%重构第1-4层细节系数
d4 = wrcoef('d',c,l,'db3',4);
d3 = wrcoef('d',c,l,'db3',3);
d2 = wrcoef('d',c,l,'db3',2);
d1 = wrcoef('d',c,l,'db3',1);
%显示细节系数
figure(2)
subplot(4,1,1);
plot(d4,'LineWidth',2);
ylabel('d4');
axis([0 N -100 100]);
subplot(4,1,2);
plot(d3,'LineWidth',2);
ylabel('d3');
axis([0 N -30 30]);
subplot(4,1,3);
plot(d2,'LineWidth',2);
ylabel('d2');
axis([0 N -5 5]);
subplot(4,1,4);
plot(d1,'LineWidth',2);
ylabel('d1');
xlabel('样本序号 n');
