%�����һ��ģ��ͼ��
load chess;
X1=X;
%����ڶ���ģ��ͼ��
load chess;
X2=X;
%����С���ֽ��ͼ���ں�
XFUS=wfusimg(X1,X2,��sym4��,5,��max��,��max��);
%��ʾ
colormap(map);
subplot(2,2,1);
image(X1);
axis square;
title(�� ģ��ͼ1��);
subplot(2,2,2);
image(X2);
axis square;
title(�� ģ��ͼ2��);
subplot(2,2,3);
image(XFUS);
axis square;
title(���ָ���ͼ��);
