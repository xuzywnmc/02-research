%���ͺ͸�ʴ
f=imread('./image/g1.tif');
subplot(2,2,1);
imshow(f,[]);
title('Subplot 1: ԭͼ')

w=[0 1  0;1 1 1;0 1  0];%ʹ����ģѡ���� 
A2=imdilate(f,w);%���ͺ���
subplot(2,2,2);
imshow(A2,[]);
title('Subplot 2: ����ͼ')

%��ʴ����
f1=imread('./image/g2.tif');
subplot(2,2,3);
imshow(f1,[]);
title('Subplot 3: ԭͼ')

se=strel('disk',10);
%����һ��ƽ̹Բ���νṹԪ�� �뾶ΪR
%strel����������ͼ����273ҳ
A2=imerode(f1,se);
subplot(2,2,4);
imshow(A2,[]);
title('Subplot 4: Բ�̸�ʴ��ͼ��')
