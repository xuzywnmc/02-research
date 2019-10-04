% 使用Cohen-Daubechies-Feauveau小波计算相应的提升方案
lscdf=liftwave('cdf3.1');
% 显示得到的提升方案
displs(lscdf);
% 将提升方案转换为双正交滤波器quadruplet
[LoD,HiD,LoR,HiR]=ls2filt(lscdf);
% 显示两种尺度和小波函数
bswfun(LoD,HiD,LoR,HiR,'plot');
