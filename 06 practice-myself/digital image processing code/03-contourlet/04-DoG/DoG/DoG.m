% Difference of Gaussians Test

close all;
clear all;
img1 = 'test.png';
img2 = 'ValveOriginal.png';
img3 = 'fish.jpg';
img4 = 'Tulips1.jpg';
img5 = 'bluemarble-512.png';
img6 = 'lena.png';
img7 = 'nickyboom.jpg';
img8 = 'orion.jpg';
img9 = 'sn.jpg';
img10 = 'hot_air_balloon.jpg';
img11 = 'im1.jpg';
img12 = 'im2.jpg';
img13 = 'im3.jpg';
img14 = 'im4.jpg';
img15 = 'im5.jpg';

Im = imread(img6);
Im = rgb2gray(Im);
Im = double(Im);

s = 3;
k = 2^1/s;
x = 5;
sigma = 1.6 * k;
thresh = 3;

A = Process(Im, 0.3, 0.4, x);
% ��ͼ��DoG�Ľ����������˹ƽ�������ֱ�Ϊsig1��sig2
B = Process(Im, 0.6, 0.7, x);
C = Process(Im, 0.7, 0.8, x);
D = Process(Im, 0.4, 0.5, x);
figure('name','A');
imshow(A, [0 1])
figure('name','B');
imshow(B, [0 1]);
figure('name','C');
imshow(C, [0,1]);
a = getExtrema(A, B, C, thresh);
% b = getExtrema(B, C, D);
% c = getExtrema(C, D, E);
% d = getExtrema(D, E, F);
% e = getExtrema(E, F, G);
% f = getExtrema(F, G, H);


% z = checkExtrema(a,b,c);
% 
figure('name','a');
imshow(a, [-1 1]);
% figure;
% imshow(b, [-1 1]);
% figure;
% imshow(c, [-1 1]);
% figure;
% imshow(d, [-1 1]);
% figure;
% imshow(e, [-1 1]);
% figure;
% imshow(f, [-1 1]);

% figure;
% imshow(z, [-1 1]);
% if (z==a)
%     disp('duh');
% end
drawExtrema(Im,a, [0 255]);
% drawExtrema(A,D, [0 1]);
% drawExtrema(B,D, [0 1]);
% drawExtrema(C,D, [0 1]);

