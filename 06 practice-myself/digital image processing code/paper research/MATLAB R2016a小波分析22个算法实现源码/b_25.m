 clear all;
X = [19.3 22.1 51.6; 34.2 70.3 82.4; 61.4 82.9 90.8; 50.5 54.9 59.1;29.4 36.3 47.0];
x = sum(X);
explode = zeros(size(x));
[c,offset] = max(x);
explode(offset) = 1;      %为1时表示与分享扇形，为0时即不分离
h = pie(x,explode); 
colormap summer           %添加颜色效果
