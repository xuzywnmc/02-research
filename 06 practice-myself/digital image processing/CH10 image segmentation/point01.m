f=imread('./image/g1.tif');
w=[-1 -1  -1;-1 8 -1;-1 -1  -1];
%imfilter���ǰ�double(f)�����w���
g=abs(imfilter(double(f),w));
a=g(:);
T=max(g(:));%���Կ�������g(:)�ǽ����󻻳�һ��
g=g>=T;
imshow(g);
title('Subplot 1:����ͼ')