%读正弦信号 
load sinper8; 
x = sinper8;
figure(1);
plot(1:length(x),x);
xlabel('样本序号 n');
ylabel('幅值 A');
% 7层harr小波包
% Shannon熵. 
wpt = wpdec(x,7,'haar','shannon');
%最优基
T=besttree(wpt);
% 小波包结构
plot(wpt);
%harr小波基下的相平面
wpviewcf(wpt,1);
%最优基下的相平面
wpviewcf(T,1);
