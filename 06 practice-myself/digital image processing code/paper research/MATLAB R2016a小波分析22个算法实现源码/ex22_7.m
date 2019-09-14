%调入第一幅模糊图像
load chess;
X1=X;
%调入第二幅模糊图像
load chess;
X2=X;
%基于小波分解的图像融合
XFUS=wfusimg(X1,X2,’sym4’,5,’max’,’max’);
%显示
colormap(map);
subplot(2,2,1);
image(X1);
axis square;
title(‘ 模糊图1’);
subplot(2,2,2);
image(X2);
axis square;
title(‘ 模糊图2’);
subplot(2,2,3);
image(XFUS);
axis square;
title(‘恢复后图像’);
