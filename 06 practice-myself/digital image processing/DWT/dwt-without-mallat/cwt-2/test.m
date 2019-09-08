%定义带宽和中心频率
fb = 1.5; fc = 1;
% 设置有效支撑和网格
lb = -8; ub = 8; n = 1000;
% 计算复Morlet小波cmor1.5-1
[psi,x] = cmorwavf(lb,ub,n,fb,fc);
% 画出复Morlet小波
figure;
plot(psi);
a=[1,2,3,4,5,6,7,8,9];
b=cumsum(a);
y = wkeep1(a,5)