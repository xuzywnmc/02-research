close all; clear all; clc; 
%Hough�任��ֵһ��λ�ڶ��Hough�任��Ԫ�� ���������ҵ��������ֵ��Hough�任��Ԫ����������λ�� �ѵ�һ���ҵ������ֵ
%��������е�Hough�任��Ԫ��Ϊ�� �ظ��ò��� ֱ���ҵ���Ҫ��ֵΪֹ �ﵽһ��ָ���ķ�ֵΪֹ
% Read image into workspace
I =imread('./image/g3.tif'); 
figure; 
subplot(221), imshow(I); 
title('Subplot 1: ԭͼ')
 
% Create binary image
BW = edge(I);
subplot(222), imshow(BW); 
title('Subplot 2: ��Ե�任ͼ')
 
% Create hough transform of image
[H, theta, rho] = hough(BW);
subplot(223), imshow(H, [], 'InitialMagnification', 'fit'); 
title('Subplot 3: ����任����')
%�ᴴ����ͼ��
subplot(224), imshow(H, [], 'InitialMagnification', 'fit'); 
title('Subplot 3: �����������任����')
axis on;%�����е��������ǩ���̶ȡ�����
axis normal;%����ǰ���������ָ�Ϊȫ�ߴ磬������λ�̶ȵ���������ȡ��
xlabel('\theta'); % ����\��x��������ʾ�ȣ�������ʾtheta
ylabel('\rho');
 
% Find peaks in the hough transform of the image and plot them
P = houghpeaks(H, 3); 
figure, imshow(H, [], 'XData', theta, 'YData', rho, 'InitialMagnification', 'fit'); 
xlabel('\theta'), ylabel('\rho'); 
axis on, axis normal, hold on; 
plot(theta(P(:, 2)), rho(P(:, 1)), 's', 'color', 'red'); 