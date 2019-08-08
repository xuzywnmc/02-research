f=imread('./image/g1.tif');
subplot(2,2,1);
imshow(f,[]);
title('Subplot 1: 原图')


%F=fft2(f,P,Q)
%以便结果函数大小PxQ
F=fft2(f);%F只是傅里叶变换
S=abs(F);%傅里叶频谱可以使用abs函数获得
subplot(2,2,2);
imshow(S,[]);
title('Subplot 2: 傅里叶变换的频谱')

Fc=fftshift(F);
%Fc是已经居中变换 fftshift就是将变换
%的原点移动到频率矩形中心
subplot(2,2,3);
imshow(abs(Fc),[]);
title('Subplot 3: 将频谱移到中心')
