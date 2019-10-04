%调频信号 
load quachirp
x=quachirp;
figure(1);
plot(1:length(x),x);
xlabel('样本序号 n');
ylabel('幅值 A');
% 4层db1小波包
wpt = wpdec(x,4,'db1');
% 小波包结构
plot(wpt);
%db1小波基下的相平面
wpviewcf(wpt,1);
