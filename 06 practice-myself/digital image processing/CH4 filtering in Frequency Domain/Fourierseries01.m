f=imread('./image/g1.tif');
subplot(2,2,1);
imshow(f,[]);
title('Subplot 1: 原图')


%F=fft2(f,P,Q)
%以便结果函数大小PxQ
F=fft2(f);
S=abs(F);%傅里叶频谱可以使用abs函数获得
subplot(2,2,2);
imshow(S,[]);
title('Subplot 2: 原图')
