close all; clear all; clc; 
%Hough变换峰值一般位于多个Hough变换单元中 方法就是找到包含最大值的Hough变换单元并记下它的位置 把第一步找到的最大值
%点的领域中的Hough变换单元设为零 重复该步骤 直到找到需要峰值为止 达到一个指定的阀值为止
% Read image into workspace
I =imread('./image/g3.tif'); 
figure; 
subplot(221), imshow(I); 
title('Subplot 1: 原图')
 
% Create binary image
BW = edge(I);
subplot(222), imshow(BW); 
title('Subplot 2: 边缘变换图')
 
% Create hough transform of image
[H, theta, rho] = hough(BW);
subplot(223), imshow(H, [], 'InitialMagnification', 'fit'); 
title('Subplot 3: 霍夫变换矩阵')
%会创造新图像
subplot(224), imshow(H, [], 'InitialMagnification', 'fit'); 
title('Subplot 3: 有坐标轴霍夫变换矩阵')
axis on;%打开所有的坐标轴标签、刻度、背景
axis normal;%将当前的坐标轴框恢复为全尺寸，并将单位刻度的所有限制取消
xlabel('\theta'); % 加上\后x坐标轴显示θ，否则显示theta
ylabel('\rho');
 
% Find peaks in the hough transform of the image and plot them
P = houghpeaks(H, 3); 
figure, imshow(H, [], 'XData', theta, 'YData', rho, 'InitialMagnification', 'fit'); 
xlabel('\theta'), ylabel('\rho'); 
axis on, axis normal, hold on; 
plot(theta(P(:, 2)), rho(P(:, 1)), 's', 'color', 'red'); 