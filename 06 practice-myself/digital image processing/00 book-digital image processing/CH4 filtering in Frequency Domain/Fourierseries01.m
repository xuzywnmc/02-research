f=imread('./image/g1.tif');
subplot(2,2,1);
imshow(f,[]);
title('Subplot 1: ԭͼ')


%F=fft2(f,P,Q)
%�Ա���������СPxQ
F=fft2(f);%Fֻ�Ǹ���Ҷ�任
S=abs(F);%����ҶƵ�׿���ʹ��abs�������
subplot(2,2,2);
imshow(S,[]);
title('Subplot 2: ����Ҷ�任��Ƶ��')

Fc=fftshift(F);
%Fc���Ѿ����б任 fftshift���ǽ��任
%��ԭ���ƶ���Ƶ�ʾ�������
subplot(2,2,3);
imshow(abs(Fc),[]);
title('Subplot 3: ��Ƶ���Ƶ�����')
