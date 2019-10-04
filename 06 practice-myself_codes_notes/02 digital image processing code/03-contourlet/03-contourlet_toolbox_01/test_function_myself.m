clear all; close all; clc;
%  img=double(imread('lena512.bmp'));
%%
%����1 ledec pfilter = 'pkva' ; �������ʲô
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
%����2 ����pdfbdec������
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
    
    if nlevs(end) ~= 0%�ж�nelvs���һλ��ʲô
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
%%%����3 ����������˹�������˲������е��˲���Ƶ��
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
%%����4 ����������˹�����������ͨ�ʹ�ͨ
%[h, g] = pfilters('pkva');
% [xlo, xhi] = lpdec(x, h, g);
% figure
% imshow(xlo)
% figure
% imshow(xhi)
%%
% ����5 [h, g] = pfilters(fname)
% g=[1,2,3,4,5,6,7,8]
% g(2:2:end) = -g(2:2:end);
%%
%����6 �����ز�������ǰ���һ���Ƿ����
% y = resamp(img,1, 1, 'per');
% imshow(y,[])
%  if y(3,:)==img(2,:)
%      tt=99;
% end
% a=zeros(3,2);
% a(2,1)=1;
%%
%����һЩ��������
% x = [1 3 5 7; 2 4 6 8; 3 5 7 9; 13 15 17 19];
% p1=x(1:2:end,:);
% p2=x(2:2:end,[2:end,1])
% p3=x(2:end,1)
%% ����wfb2dec�任�Ƿ�Ϊ��άС���任
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