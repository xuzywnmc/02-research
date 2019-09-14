%装载采集的信号leleccum.mat
load leleccum;
%将信号中第1160到第1235个采样点赋给s
index=1160:1235;
s=leleccum(index);
%画出原始信号
figure(1);
plot(index,s);
xlabel('样本序号 n');
ylabel('幅值 A');

%用db3小波进行5层分解
[c,l]=wavedec(s,5,'db3');
%重构第1-5层逼近信号
a5 = wrcoef('a',c,l,'db3',5);
a4 = wrcoef('a',c,l,'db3',4);
a3 = wrcoef('a',c,l,'db3',3);
a2 = wrcoef('a',c,l,'db3',2);
a1 = wrcoef('a',c,l,'db3',1);
%重构第1-5层细节信号
d5 = wrcoef('d',c,l,'db3',5);
d4 = wrcoef('d',c,l,'db3',4);
d3 = wrcoef('d',c,l,'db3',3);
d2 = wrcoef('d',c,l,'db3',2);
d1 = wrcoef('d',c,l,'db3',1);
%显示细节信号
figure(2)
subplot(3,1,1);
plot(index,d3,'LineWidth',2);
ylabel('d3');
subplot(3,1,2);
plot(index,d2,'LineWidth',2);
ylabel('d2');
subplot(3,1,3);
plot(index,d1,'LineWidth',2);
ylabel('d1');
xlabel('样本序号 n');
%消除奇异点
%%设置1-3层细节信号为零
s0=a5+d5+d4;
%画出重构信号
figure(3);
plot(index,s0);
xlabel('样本序号 n');
ylabel('幅值 A');
