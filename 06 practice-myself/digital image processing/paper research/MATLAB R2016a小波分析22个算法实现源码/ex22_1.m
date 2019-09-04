%装载原始图像
load gatlin;

%对图像加噪声并显示出含噪图像
init=2788605800;
randn('seed',init);
X=X+10*randn(size(X));
subplot(2,2,1);
image(X);
colormap(map);
title('含噪图像');

%应用中值滤波进行图像平滑处理
[p,q]=size(X);
for i=2:p-1
    for j=2:q-1
        Xtemp=0;
        for m=1:3
            for n=1:3
                Xtemp=Xtemp+X(i+m-2,j+n-2);
            end
        end
        Xtemp=Xtemp/9;
        X1(i,j)=Xtemp;
    end
end

%显示结果
subplot(2,2,2);
image(X1);
colormap(map);
title('平滑后图像');
