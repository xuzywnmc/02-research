%调频信号 
for i=1:512
    x(i)=sin(500*pi*i/1000+20*sin(20*pi*i/1000));
end
figure(1);
plot(1:length(x),x);
xlabel('样本序号 n');
ylabel('幅值 A');
% 3层haar小波包
wpt = wpdec(x,3,'haar');
%最优基
T=besttree(wpt);
% 小波包结构
plot(wpt);
%haar小波基下的相平面
wpviewcf(wpt,1);
