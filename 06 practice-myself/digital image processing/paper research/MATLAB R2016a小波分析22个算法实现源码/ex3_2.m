%装载并显示原始图像
load julia;
subplot(2,2,1);
image(X);
colormap(map);
title('原始图像');
axis square;

%在图像中加入噪声
init=2055615866;
randn('seed',init);
X1=X+10*randn(size(X));
subplot(2,2,2);
image(X1);
colormap(map);
title('含噪图像');
axis square;

%基于小波包的消噪处理
thr=10;sorh='s';
crit='shannon';
keepapp=0;
X2=wpdencmp(X1,sorh,3,'sym4',crit,thr,keepapp);

%画出消噪后的图像
subplot(2,2,3);
image(X2);
colormap(map);
title('全局阈值消噪图像');
axis square;

%对图像进行平滑处理以增强消噪效果（中值滤波）
for i=2:175;
    for j=2:259
        Xtemp=0;
        for m=1:3
            for n=1:3
                Xtemp=Xtemp+X2(i+m-2,j+n-2);
            end
        end
        Xtemp=Xtemp/9;
        X3(i,j)=Xtemp;
    end
end

%显示平滑结果
subplot(2,2,4);
image(X3);
colormap(map);
title('平滑后的图像');
axis square;
