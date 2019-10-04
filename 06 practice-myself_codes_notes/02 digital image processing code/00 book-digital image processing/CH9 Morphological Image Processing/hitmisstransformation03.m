%击中或击不中变换
f=imread('./image/g5.tif');
subplot(2,2,1);
imshow(f,[]);
title('Subplot 1: 原图');

B1=strel([0 0 0;0 1 1;0 1 0]);
B2=strel([1 1 1;1 0 0;1 0 1]);
g=bwhitmiss(f,B1,B2);
subplot(2,2,2);
%figure;
imshow(g,[]);
title('Subplot 2: 击中或击不中变换')

