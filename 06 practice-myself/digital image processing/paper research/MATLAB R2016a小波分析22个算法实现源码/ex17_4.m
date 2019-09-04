%delta信号 
x=zeros(1,256);
x(150)=1;
figure(1);
plot(1:length(x),x);
xlabel('样本序号 n');
ylabel('幅值 A');
% 3层db1小波包
wpt = wpdec(x,3,'db1');
%最优基
T=besttree(wpt);
% 小波包结构
plot(wpt);
%db1小波基下的时频面
wpviewcf(wpt,1);
