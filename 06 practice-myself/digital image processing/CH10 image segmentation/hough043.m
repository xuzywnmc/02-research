close all; clear all; clc; 
 
% Read image into workspace
I = imread('./image/g3.tif'); 
figure; 
subplot(231), imshow(I); 
 
% Rotate the image
% 旋转函数imrotate
rotI = imrotate(I, 33, 'crop'); 
subplot(232), imshow(rotI); 
 
% Create a binary image
BW = edge(I); 
%BW = edge(rotI, 'canny');由于没有canny函数 容易报错
subplot(233), imshow(BW); 
 
% Create the hough transform using the binary（二进制） image 
[H, T, R] = hough(BW); 
subplot(234), imshow(H, [], 'XData', T, 'YData', R, 'InitialMagnification', 'fit'); 
xlabel('\theta'), ylabel('\rho'); 
axis on, axis normal, hold on;
colormap(gca, hot);
 
% Find peaks in the hough transform of the image
P = houghpeaks(H, 5); 
x = T(P(:,2));
y = R(P(:,1)); 
plot(x, y, 's', 'color', 'blue'); 
 
% Find lines and plot them
lines = houghlines(BW, T, R, P, 'FillGap', 5, 'MinLength', 7); 
subplot(235), imshow(rotI), hold on; 
max_len = 0; 
for k = 1 : length(lines)  % here length(lines)=12
   xy = [lines(k).point1; lines(k).point2]; 
   plot(xy(:, 1), xy(:, 2), 'LineWidth', 2, 'Color', 'green');
   
   % Plot beginnings and ends of lines
   plot(xy(1,1), xy(1,2), 'x', 'LineWidth', 2, 'Color', 'yellow');
   plot(xy(2,1), xy(2,2), 'x', 'LineWidth', 2, 'Color', 'red'); 
   
   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2); % distance between point1 and point2
   if ( len > max_len )
      max_len = len; 
      xy_long = xy; 
   end
end
 
% Highlinght the longest line segment by coloring it cyan
plot(xy_long(:, 1), xy_long(:, 2), 'LineWidth', 2, 'Color', 'cyan'); 