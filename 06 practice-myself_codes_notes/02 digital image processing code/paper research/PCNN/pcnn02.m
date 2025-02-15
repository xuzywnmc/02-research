%------Pulse Coupled Neural Network-----------    
%------名称：脉冲耦合神经网络（PCNN）

   
function H = PCNN2(I) 
I = imread('1.png'); 
figure,imshow(I);
title('原始图像');
th = graythresh(I);
%是使用最大类间方差法找到图片的一个合适的阈值（threshold）
I = im2bw(I,th);
%转化为灰度图像
%H = Pcnn(I,30); 


%************************************************************ 
% Initialize Function 
%************************************************************ 
[m,n] = size (I); 
figure,imshow(I);
title('二值图像');
X = im2double(I); 


%************************************************************ 
% Initialize PCNN Parameters 
%************************************************************ 
% P ：L E F VF VL VE beta 
% V: 1.0 1.0 0.1 0.5 0.2 20 0.1 
al = 1.0; ae = 1.0; af = 0.1; vf = 0.5; vl = 0.2; ve = 20; B = 0.1; 
W =[0.5 1 0.5;... 
        1 0 1;...    
        0.5 1 0.5]; 
M = W; Y = zeros(m,n); F = Y; L = Y; U = Y; E = Y; 


%************************************************************ 
% PCNN 点火过程 
%************************************************************ 
for i = 1:30 
    wk = conv2(Y,M,'same');
    F = exp(-af).* F + vf.* wk + X; 
    L = exp(-al).* L + vl.* wk; 
    U = F.*(1 + B.* L); 
    Y = double(U>E); 
    E = exp(-ae).* E + ve.* Y; 
end
figure,imshow(Y)
title('PCNN处理后图像');
fs = fspecial('sobel');
filter_Y = imfilter(Y, fs);
figure,imshow(filter_Y); 
title('滤波图像');
