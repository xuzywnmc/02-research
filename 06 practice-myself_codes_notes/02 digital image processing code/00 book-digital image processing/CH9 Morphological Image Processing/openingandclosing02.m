%������ͱ�����
f=imread('./image/g3.tif');
subplot(2,3,1);
imshow(f,[]);
title('Subplot 1: ԭͼ1')

se=strel('square',20);
f0=imopen(f,se);
%������
subplot(2,3,2);
imshow(f0,[]);
title('Subplot 2: ԭͼ1������')


f0=imclose(f,se);
%������
subplot(2,3,3);
imshow(f0,[]);
title('Subplot 3: ԭͼ1������')

clear;

f1=imread('./image/g4.tif');
subplot(2,3,4);
imshow(f1,[]);
title('Subplot 1: ԭͼ2')


se=strel('square',3);
f0=imopen(f1,se);
%������
subplot(2,3,5);
imshow(f0,[]);
title('Subplot 2: ԭͼ2������')


f0=imclose(f1,se);
%������
subplot(2,3,6);
imshow(f0,[]);
title('Subplot 3: ԭͼ2������')
