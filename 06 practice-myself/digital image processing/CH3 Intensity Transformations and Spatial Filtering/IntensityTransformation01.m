f=imread('./image/g1.tif');
subplot(2,2,1);
imshow(f,[]);
title('Subplot 1: ԭͼ')

%ת������ 0���1 1���0
g1=imadjust(f,[0 1],[1 0]);
subplot(2,2,2);
imshow(g1,[]);
title('Subplot 2: ��תͼ��')

%�����任
f=imread('./image/g2.tif');
subplot(2,2,3);
imshow(f,[]);
title('Subplot 3: ԭͼ')

g=im2uint8(mat2gray(log(1+double(f))));
subplot(2,2,4);
imshow(g,[]);
title('Subplot 4: �����任')
