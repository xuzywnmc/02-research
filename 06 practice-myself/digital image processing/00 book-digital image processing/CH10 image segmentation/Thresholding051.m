%��ֵ������
close all; clear all; clc; 
f=imread('./image/g4.tif');
subplot(2,2,1);
imshow(f,[]);
title('Subplot 1: ԭͼ');
T=graythresh(f);
T=T*255;
f1=f>=T
subplot(2,2,2);
imshow(f1,[]);
title('Subplot 2: �׵׺���');
f1=~(f>=T);
subplot(2,2,3);
imshow(f1,[]);
title('Subplot 3: �ڵװ���');


%�ֲ���ֵ����
%ȫ�ַ�ֵ�������ڱ������������ȵ�ʱ���п�����Ч 
%һ�ֳ��ô������������������Ԥ�����Բ�������

