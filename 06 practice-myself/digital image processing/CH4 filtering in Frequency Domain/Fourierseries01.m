f=imread('./image/g1.tif');
subplot(2,2,1);
imshow(f,[]);
title('Subplot 1: ԭͼ')


%F=fft2(f,P,Q)
%�Ա���������СPxQ
F=fft2(f);
S=abs(F);%����ҶƵ�׿���ʹ��abs�������
subplot(2,2,2);
imshow(S,[]);
title('Subplot 2: ԭͼ')
