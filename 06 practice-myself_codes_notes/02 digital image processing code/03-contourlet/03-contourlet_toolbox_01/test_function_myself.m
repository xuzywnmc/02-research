clear all; close all; clc;
%  img=double(imread('lena512.bmp'));
%%
%测试1 ledec pfilter = 'pkva' ; 输出到底什么
%%
%     [h, g] = pfilters('pkva');
%         % Laplacian decomposition
%         [xlo, xhi] = lpdec(img, h, g);
% % lpdec Output: 
% %   c:      coarse image at half size
% %   d:      detail image at full size
%     figure('name','coarse image at half size');
%     imshow(xlo,[]);
%     figure('name','detail image at full size');
%     imshow(xhi,[]);
%%
%测试2 测试pdfbdec如何输出
% 
if ~exist('im', 'var')
    % Zoneplate image: good for illustrating multiscale and directional
    % decomposition
    im = imread ('zoneplate.png') ;
end
figure
imshow(im,[]);
x=double(im);
nlevs = [0,1,2] ;        % Decomposition level
pfilt = 'pkva' ;              % Pyramidal filter
dfilt = 'pkva' ;              % Directional filter
if length(nlevs) == 0
    y = {x};
else
    % Get the pyramidal filters from the filter name
    [h, g] = pfilters(pfilt);
    
    if nlevs(end) ~= 0%判断nelvs最后一位是什么
        % Laplacian decomposition
        [xlo, xhi] = lpdec(x, h, g);
        % DFB on the bandpass image
        switch dfilt        % Decide the method based on the filter name
            case {'pkva6', 'pkva8', 'pkva12', 'pkva'}   
                % Use the ladder structure (whihc is much more efficient)
                xhi_dir = dfbdec_l(xhi, dfilt, nlevs(end));
            
            otherwise       
                % General case
                xhi_dir = dfbdec(xhi, dfilt, nlevs(end));                
        end
%         
     else        
%         % Special case: nlevs(end) == 0
%         % Perform one-level 2-D critically sampled wavelet filter bank
        [xlo, xLH, xHL, xHH] = wfb2dec(x, h, g);
        xhi_dir = {xLH, xHL, xHH};
    end
    
    % Recursive call on the low band
    ylo = pdfbdec(xlo, pfilt, dfilt, nlevs(1:end-1));
 
    % Add bandpass directional subbands to the final output
    y = {ylo{:}, xhi_dir};
end
figure
imcoeff = showpdfb( y )
%%
%%%测试3 测试拉普拉斯金字塔滤波器序列的滤波器频谱
% [h, g] = pfilters('pkva');
% fs=23;
% t=(1:23)/fs;
% figure
% tt=fft(h)
% plot(t,abs(tt))
% fs=45;
% t=(1:fs)/fs;
% figure
% tt1=fft(g)
% plot(t,abs(tt1))
%%
%%测试4 测试拉普拉斯金字塔输出高通和带通
%[h, g] = pfilters('pkva');
% [xlo, xhi] = lpdec(x, h, g);
% figure
% imshow(xlo)
% figure
% imshow(xhi)
%%
% 测试5 [h, g] = pfilters(fname)
% g=[1,2,3,4,5,6,7,8]
% g(2:2:end) = -g(2:2:end);
%%
%测试6 测试重采样函数前后第一列是否相等
% y = resamp(img,1, 1, 'per');
% imshow(y,[])
%  if y(3,:)==img(2,:)
%      tt=99;
% end
% a=zeros(3,2);
% a(2,1)=1;
%%
%测试一些矩阵运算
% x = [1 3 5 7; 2 4 6 8; 3 5 7 9; 13 15 17 19];
% p1=x(1:2:end,:);
% p2=x(2:2:end,[2:end,1])
% p3=x(2:end,1)
%% 测试wfb2dec变换是否为二维小波变换
%  [h, g] = pfilters('pkva');
%  img=double(imread('test22.tif'));
%  [xlo, xLH, xHL, xHH]=wfb2dec(img, h, g);
% figure
% subplot(221)
% imshow(xlo,[]);
%   subplot(222)
%   imshow(xLH,[]);
%  subplot(223)
%  imshow(xHL,[]); 
%  subplot(224)
%  imshow(xHH,[]);