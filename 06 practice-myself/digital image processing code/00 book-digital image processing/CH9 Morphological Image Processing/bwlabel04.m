%标注连接分量使用
% 8邻接像素位置 然后进行标注 求得平均值就得到了分离图像的中心像素
f=imread('./image/g6.tif');
subplot(2,2,1);
imshow(f,[]);
title('Subplot 1: 原图');

[L,n]=bwlabel(f);
%conn参数 默认值是8 也就是8连接 num是连接分量的总数 L是标记矩阵
[r,c]=find(L==3);
%find是返回行列所在位置 r是行向量位置 c是列向量位置
rbar=mean(r);
cbar=mean(c);
subplot(2,2,2);
imshow(f,[]);
title('Subplot 2: 原图');

 hold on
%  保留当前坐标区中的绘图，从而使新添加到坐标区中的绘图不会删除现有绘图。
%  新绘图基于坐标区的
%  ColorOrder 和 LineStyleOrder 属性使用后续的颜色和线型。
for k=1:n
    [r,c]=find(L==k);
    rbar=mean(r);
    cbar=mean(c);
    plot(cbar,rbar,'Marker','o','MarkerEdgeColor','k','MarkerFaceColor','k','MarkerSize',10);
    plot(cbar,rbar,'*','MarkerEdgeColor','w');
end
    