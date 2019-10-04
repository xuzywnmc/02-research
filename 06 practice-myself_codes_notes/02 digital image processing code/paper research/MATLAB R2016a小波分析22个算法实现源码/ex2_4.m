load facets
subplot(2,2,1);
image(X);
colormap(map);
title('原始图像');

%生成含噪图像并图示
init=2055615866;
randn('seed',init);
XX=X+8*randn(size(X));
subplot(2,2,2);
image(XX);
colormap(map);
title('含噪图像');

%对图像进行消噪处理
%用小波函数coif2对图像XX进行2层分解
[c,l]=wavedec2(XX,2,'coif2');
%设置尺度向量
n=[1,2];
%设置阈值向量
p=[10.28,24.08];

%对高频小波系数进行阈值处理
%nc=wthcoef2(‘h’,c,l,n,p,’s’);
%nc=wthcoef2(‘v’,c,l,n,p,’s’);
nc=wthcoef2('d',c,l,n,p,'s');
%图像的二维小波重构
X1=waverec2(nc,l,'coif2');
subplot(2,2,3);
image(X1);
colormap(map);
title('第一次消噪后的图像');

%再次对高频小波系数进行阈值处理
%mc=wthcoef2(‘h’,nc,l,n,p,’s’);
mc=wthcoef2('v',nc,l,n,p,'s');
%mc=wthcoef2(‘d’,nc,l,n,p,’s’);

%%图像的二维小波重构
X2=waverec2(mc,l,'coif2');
subplot(2,2,4);
image(X2);
colormap(map);
title('第二次消噪后的图像');
