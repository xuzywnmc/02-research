%
% line detection program
%
% ע��֮��������˵��ģ�Ե����ص�ֱ�߸���������Ϊ��ģ����ͻ�������ǵ�����
f=imread('./image/g2.tif');
w=[2 -1  -1;-1 2 -1;-1 -1  2];%ʹ����ģѡ���� 
%֮���Լ��-45�����õ�����������ģ����Ϊ����б�� ��2��ֵ�����൱�ھ���
%�Ŵ�б������
g=imfilter(double(f),w);
subplot(2,2,1);
imshow(g,[]);
title('Subplot 1: ��ģ����ͼ')


gtop=g(1:120,1:120);%%�Ŵ����ϽǺ���
gtop=pixeldup(gtop,4);
subplot(2,2,2);
imshow(gtop,[]);
title('Subplot 2: ���ϽǷŴ�ͼ')
% figure,imshow(gtop,[]);���������д �ͻᵼ�²�����ͼ�� �������ͬһ��ͼ��
gbot = g(end-119:end, end-119:end);
gbot = pixeldup(gbot, 4);
subplot(2,2,3)
imshow(gbot,[]);
title('Subplot 3: ���½ǷŴ�ͼ')

g = abs(g);
T = max(g(:));
g = g >= T;
subplot(2,2,4)
imshow(g,[]);
title('Subplot 4: ��ģ����ͼ��������ͼ')