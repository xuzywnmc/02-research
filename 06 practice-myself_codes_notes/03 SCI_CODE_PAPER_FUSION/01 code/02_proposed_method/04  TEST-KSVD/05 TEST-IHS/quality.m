% % % % % % % % % % % % % % % % % % % % % % %  
% 比较原图像与融合图像在HSI颜色空间的I分量的MSSIM值
% % % % % % % % % % % % % % % % % % % % % % % 
function [SSIM,RMSE,MI,PSNR,SF]=quality(x1,x2,f)
%  HSI1 = rgb2hsi (x1);
%  HSI2 = rgb2hsi (x2);
%  HSIf = rgb2hsi (f);
 
 % % % % % % % % % % % % % % % % % % %  HSI颜色空间中I分量的MSSIM值
 I1=x1;I2=x2; If=f;  
% % % % % % % % % % % % % %  
K = [0.01 0.03]; window = fspecial('gaussian', 11, 1.5);L=5;
% % % % % % % % % % % % % 
 mssim_1f=ssim_index(I1, If, K, window, L);
 mssim_2f=ssim_index(I2, If, K, window, L);
 SSIM = max(mssim_1f, mssim_2f);
%  fprintf('\n\n   I分量的SSIM为:  :%.4f\n'  ,SSIM);
%  
y1=rmse(I1,If);
y2=rmse(I2,If);
RMSE=max(y1,y2);
% fprintf('\n\n   I分量的rmse为:  :%.4f\n'  ,RMSE);

% AG=avg_gradient(If);
% fprintf('\n\n   I分量的avg_gradient为:  :%.4f\n'  ,AG);

% EI=edge_intensity(If);
% fprintf('\n\n   I分量的edge_intensity为:  :%.4f\n'  ,EI);

y1=mutinf(I1,If);
y2=mutinf(I2,If);
MI=max(y1,y2);
% fprintf('\n\n   I分量的MI为:  :%.4f\n'  ,MI);
% 
y1=my_PSNR_rms(I1,If);
y2=my_PSNR_rms(I2,If);
PSNR=max(y1,y2);
% fprintf('\n\n   I分量的PSNR为:  :%.4f\n'  ,PSNR);
% 
SF=space_frequency(If);
% fprintf('\n\n   I分量的SF为:  :%.4f\n'  ,SF);

% STD=stand_deviation(If);
% fprintf('\n\n   I分量的stand_deviation为:  :%.4f\n'  ,STD);
% 
% y=variance(If);
% fprintf('\n\n   I分量的variance为:  :%.4f\n'  ,y);

% y = SSEQ(f);
% fprintf('\n\n   I分量的SSEQ为:  :%.4f\n'  ,y);

% y =  biqi( HSIf);
% fprintf('\n\n   I分量的BIQI为:  :%.4f\n'  ,y);



% % % % % % % % % % % % % % % % % % % % 
end
% % % % % % % % % % % % % % 计算PSNR
function psnr_rms = my_PSNR_rms(ideal_img, compress_img)
[row col] = size(ideal_img);
ideal_img = double(ideal_img);
compress_img = double(compress_img);
fenzi = 0;    %分子项
fenmu = 0;    %分母项
fenzi = 255*255;
fenmu = sum(sum((compress_img-ideal_img).^2))/(row*col);
snr_rms = fenzi/fenmu;
psnr_rms = 10*log10(snr_rms);
end
% % % % % % % % % % % % % % % % % % % 
        
function hsi = rgb2hsi(rgb)
%RGB2HSI Converts an RGB image to HSI.
%   HSI = RGB2HSI(RGB) converts an RGB image to HSI. The input image
%   is assumed to be of size M-by-N-by-3, where the third dimension
%   accounts for three image planes: red, green, and blue, in that
%   order. If all RGB component images are equal, the HSI conversion
%   is undefined. The input image can be of class double (with values
%   in the range [0, 1]), uint8, or uint16. 
%
%   The output image, HSI, is of class double, where:
%     hsi(:, :, 1) = hue image normalized to the range [0, 1] by
%                    dividing all angle values by 2*pi. 
%     hsi(:, :, 2) = saturation image, in the range [0, 1].
%     hsi(:, :, 3) = intensity image, in the range [0, 1].

%   Copyright 2002-2004 R. C. Gonzalez, R. E. Woods, & S. L. Eddins
%   Digital Image Processing Using MATLAB, Prentice-Hall, 2004
%   $Revision: 1.5 $  $Date: 2005/01/18 13:44:59 $

% Extract the individual component images.
rgb = im2double(rgb);
r = rgb(:, :, 1);
g = rgb(:, :, 2);
b = rgb(:, :, 3);

% Implement the conversion equations.
num = 0.5*((r - g) + (r - b));
den = sqrt((r - g).^2 + (r - b).*(g - b));
theta = acos(num./(den + eps));

H = theta;
H(b > g) = 2*pi - H(b > g);
H = H/(2*pi);

num = min(min(r, g), b);
den = r + g + b;
den(den == 0) = eps;
S = 1 - 3.* num./den;

H(S == 0) = 0;

I = (r + g + b)/3;

% Combine all three results into an hsi image.
hsi = cat(3, H, S, I);
end

function [mssim, ssim_map] = ssim_index(img1, img2, K, window, L)

%========================================================================
%SSIM Index, Version 1.0
%Copyright(c) 2003 Zhou Wang
%All Rights Reserved.
%
%The author is with Howard Hughes Medical Institute, and Laboratory
%for Computational Vision at Center for Neural Science and Courant
%Institute of Mathematical Sciences, New York University.
%
%----------------------------------------------------------------------
%Permission to use, copy, or modify this software and its documentation
%for educational and research purposes only and without fee is hereby
%granted, provided that this copyright notice and the original authors'
%names appear on all copies and supporting documentation. This program
%shall not be used, rewritten, or adapted as the basis of a commercial
%software or hardware product without first obtaining permission of the
%authors. The authors make no representations about the suitability of
%this software for any purpose. It is provided "as is" without express
%or implied warranty.
%----------------------------------------------------------------------
%
%This is an implementation of the algorithm for calculating the
%Structural SIMilarity (SSIM) index between two images. Please refer
%to the following paper:
%
%Z. Wang, A. C. Bovik, H. R. Sheikh, and E. P. Simoncelli, "Image
%quality assessment: From error measurement to structural similarity"
%IEEE Transactios on Image Processing, vol. 13, no. 1, Jan. 2004.
%
%Kindly report any suggestions or corrections to zhouwang@ieee.org
%
%----------------------------------------------------------------------
%
%Input : (1) img1: the first image being compared
%        (2) img2: the second image being compared
%        (3) K: constants in the SSIM index formula (see the above
%            reference). defualt value: K = [0.01 0.03]
%        (4) window: local window for statistics (see the above
%            reference). default widnow is Gaussian given by
%            window = fspecial('gaussian', 11, 1.5);
%        (5) L: dynamic range of the images. default: L = 255
%
%Output: (1) mssim: the mean SSIM index value between 2 images.
%            If one of the images being compared is regarded as 
%            perfect quality, then mssim can be considered as the
%            quality measure of the other image.
%            If img1 = img2, then mssim = 1.
%        (2) ssim_map: the SSIM index map of the test image. The map
%            has a smaller size than the input images. The actual size:
%            size(img1) - size(window) + 1.
%
%Default Usage:
%   Given 2 test images img1 and img2, whose dynamic range is 0-255
%
%   [mssim ssim_map] = ssim_index(img1, img2);
%
%Advanced Usage:
%   User defined parameters. For example
%
%   K = [0.05 0.05];
%   window = ones(8);
%   L = 100;
%   [mssim ssim_map] = ssim_index(img1, img2, K, window, L);
%
%See the results:
%
%   mssim                        %Gives the mssim value
%   imshow(max(0, ssim_map).^4)  %Shows the SSIM index map
%
%========================================================================


if (nargin < 2 || nargin > 5)
   ssim_index = -Inf;
   ssim_map = -Inf;
   return;
end

if (size(img1) ~= size(img2))
   ssim_index = -Inf;
   ssim_map = -Inf;
   return;
end

[M N] = size(img1);

if (nargin == 2)
   if ((M < 11) || (N < 11))
	   ssim_index = -Inf;
	   ssim_map = -Inf;
      return
   end
   window = fspecial('gaussian', 11, 1.5);	%
   K(1) = 0.01;								      % default settings
   K(2) = 0.03;								      %
   L = 255;                                  %
end

if (nargin == 3)
   if ((M < 11) || (N < 11))
	   ssim_index = -Inf;
	   ssim_map = -Inf;
      return
   end
   window = fspecial('gaussian', 11, 1.5);
   L = 255;
   if (length(K) == 2)
      if (K(1) < 0 || K(2) < 0)
		   ssim_index = -Inf;
   		ssim_map = -Inf;
	   	return;
      end
   else
	   ssim_index = -Inf;
   	ssim_map = -Inf;
	   return;
   end
end

if (nargin == 4)
   [H W] = size(window);
   if ((H*W) < 4 || (H > M) || (W > N))
	   ssim_index = -Inf;
	   ssim_map = -Inf;
      return
   end
   L = 255;
   if (length(K) == 2)
      if (K(1) < 0 || K(2) < 0)
		   ssim_index = -Inf;
   		ssim_map = -Inf;
	   	return;
      end
   else
	   ssim_index = -Inf;
   	ssim_map = -Inf;
	   return;
   end
end

if (nargin == 5)
   [H W] = size(window);
   if ((H*W) < 4 || (H > M) || (W > N))
	   ssim_index = -Inf;
	   ssim_map = -Inf;
      return
   end
   if (length(K) == 2)
      if (K(1) < 0 || K(2) < 0)
		   ssim_index = -Inf;
   		ssim_map = -Inf;
	   	return;
      end
   else
	   ssim_index = -Inf;
   	ssim_map = -Inf;
	   return;
   end
end

C1 = (K(1)*L)^2;
C2 = (K(2)*L)^2;
window = window/sum(sum(window));
img1 = double(img1);
img2 = double(img2);

mu1   = filter2(window, img1, 'valid');
mu2   = filter2(window, img2, 'valid');
mu1_sq = mu1.*mu1;
mu2_sq = mu2.*mu2;
mu1_mu2 = mu1.*mu2;
sigma1_sq = filter2(window, img1.*img1, 'valid') - mu1_sq;
sigma2_sq = filter2(window, img2.*img2, 'valid') - mu2_sq;
sigma12 = filter2(window, img1.*img2, 'valid') - mu1_mu2;

if (C1 > 0 & C2 > 0)
   ssim_map = ((2*mu1_mu2 + C1).*(2*sigma12 + C2))./((mu1_sq + mu2_sq + C1).*(sigma1_sq + sigma2_sq + C2));
else
   numerator1 = 2*mu1_mu2 + C1;
   numerator2 = 2*sigma12 + C2;
	denominator1 = mu1_sq + mu2_sq + C1;
   denominator2 = sigma1_sq + sigma2_sq + C2;
   ssim_map = ones(size(mu1));
   index = (denominator1.*denominator2 > 0);
   ssim_map(index) = (numerator1(index).*numerator2(index))./(denominator1(index).*denominator2(index));
   index = (denominator1 ~= 0) & (denominator2 == 0);
   ssim_map(index) = numerator1(index)./denominator1(index);
end

mssim = mean2(ssim_map);

return
end

% % % % % % % % % % % % % % % % % % RMSE
function rmse = rmse(imgfusion,imgstandard) 
% 两个参数
[m n]=size(imgfusion);
temp=sqrt(sum(sum((imgfusion-imgstandard).^2)));
rmse=temp/(m*n);
end
% % % % % % % % % % % % % % % % % % % % % % 计算图像的平均梯度
function outval = avg_gradient(img) 
% OUTVAL = AVG_GRADIENT(IMG) 一个参数
 
if nargin == 1 
    img = double(img); 
    % Get the size of img 
    [r,c,b] = size(img); 
     
    dx = 1; 
    dy = 1; 
    for k = 1 : b 
        band = img(:,:,k); 
        [dzdx,dzdy] = gradient(band,dx,dy); 
        s = sqrt((dzdx .^ 2 + dzdy .^2) ./ 2); 
        g(k) = sum(sum(s)) / ((r - 1) * (c - 1)); 
    end 
    outval = mean(g); 
else 
    error('Wrong number of input!'); 
end
end

% % % % % % % % % % % % % 图像的边缘信息

function outval = edge_intensity(img) 
% OUTVAL = EDGE_INTENSITY(IMG) 一个参数
 
if nargin == 1 
    img = double(img); 
    % Create horizontal sobel matrix 
    w = fspecial('sobel'); 
     
    % Get the size of img 
    [r c k] = size(img); 
     
    gx = imfilter(img,w,'replicate'); 
    gy = imfilter(img,w','replicate'); 
     
    for m = 1 : r 
        for n = 1 : c 
            for q = 1 : k 
                g(m,n,q) = sqrt(gx(m,n,q)*gx(m,n,q) + gy(m,n,q)*gy(m,n,q)); 
            end 
        end 
    end 
    outval = mean(mean(mean(g))); 
else 
    error('Wrong number of input!'); 
end 
end
% % % % % % % % % % % % % 计算图像的互信息熵
function mi = mutinf(a, b)
% a=rgb2gray(a); 两个参数
% b=rgb2gray(b);
a=double(a);
b=double(b);
[Ma,Na] = size(a);
[Mb,Nb] = size(b);
M=min(Ma,Mb);
N=min(Na,Nb);

%初始化直方图数组
hab = zeros(256,256);
ha = zeros(1,256);
hb = zeros(1,256);

%归一化
if max(max(a))~=min(min(a))
    a = (a-min(min(a)))/(max(max(a))-min(min(a)));
else
    a = zeros(M,N);
end

if max(max(b))-min(min(b))
    b = (b-min(min(b)))/(max(max(b))-min(min(b)));
else
    b = zeros(M,N);
end

a = double(int16(a*255))+1;
b = double(int16(b*255))+1;

%统计直方图
for i=1:M
    for j=1:N
       indexx =  a(i,j);
       indexy = b(i,j) ;
       hab(indexx,indexy) = hab(indexx,indexy)+1;%联合直方图
       ha(indexx) = ha(indexx)+1;%a图直方图
       hb(indexy) = hb(indexy)+1;%b图直方图
   end
end

%计算联合信息熵
hsum = sum(sum(hab));
index = find(hab~=0);
p = hab/hsum;
Hab = sum(sum(-p(index).*log(p(index))));

%计算a图信息熵
hsum = sum(sum(ha));
index = find(ha~=0);
p = ha/hsum;
Ha = sum(sum(-p(index).*log(p(index))));

%计算b图信息熵
hsum = sum(sum(hb));
index = find(hb~=0);
p = hb/hsum;
Hb = sum(sum(-p(index).*log(p(index))));

%计算a和b的互信息
mi = Ha+Hb-Hab;

%计算a和b的归一化互信息
mi1 = hab/(Ha+Hb); 
end


% % % % % % % % % % % % % % % % % % 计算空间频率
function SF=space_frequency(X)
% % % % % 一个参数
SF=0;
[n0,n0,k]=size(X);%%%%   X是一个方阵
if k==3%不知道这里频率是否需要三个一起加
   
    X=double(X(:,:,2));

    X=double(X);                          %空间频率;
    RF=0;
    CF=0;

    for fi=1:n0
        for fj=2:n0
            RF=RF+(X(fi,fj)-X(fi,fj-1)).^2;
        end
    end

    RF=RF/(n0*n0);

    for fj=1:n0
        for fi=2:n0
            CF=CF+(X(fi,fj)-X(fi-1,fj)).^2;
        end
    end

    CF=CF/(n0*n0);%%%%可以思考，空间频率是不是只描述一个方阵
    SF=sqrt(RF+CF);
    end

end
% % % % % % % % % % % % 计算标准差
function e=stand_deviation(matrix)
[m,n] = size(matrix);
m = mean(mean(matrix));
e = sum(sum((matrix-m).^2));
e = e/((m*n)^2);
e = sqrt(e);
end
% % % % % % % % % % % % 计算方差
function [img_mean,img_var] = variance(img)
% 一个参数
img = double(img); 
% Get rows and colums of img 
[r c] = size(img); 
     
% Mean value 
img_mean = mean(mean(img)); 
 
% Variance 
img_var = sqrt(sum(sum((img - img_mean).^2)) / (r * c ));
end