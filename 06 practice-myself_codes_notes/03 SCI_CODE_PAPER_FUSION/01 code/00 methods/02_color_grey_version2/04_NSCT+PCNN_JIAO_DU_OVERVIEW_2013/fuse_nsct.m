function Y = fuse_nsct(imx, imy,  lf, hf)
%Y = fuse_dwb(M1, M2, zt, ap, mp) image fusion with DWT, Wavelet is DBSS(2,2)
%
%    M1 - input image A
%    M2 - input image B
%    lf - coefficient selection base image (see selb.m) 
%    hf - coefficient selection highpass (see selc.m) 
%   
%
%    Y  - fused image   

%    (Oliver Rockinger 16.08.99)

% check inputs 
[z1 s1] = size(imx);
[z2 s2] = size(imy);
if (z1 ~= z2) | (s1 ~= s2)
  error('Input images are not of same size');
end;


% 构造剪切波的系数
% Parameteters:
nlevels =  [0, 1, 3] ;        % Decomposition level
pfilter = 'maxflat' ;              % Pyramidal filter
dfilter = 'dmaxflat7' ;              % Directional filter



% Take translation invariant shearlet transform with Hard Thresholding. 
disp(' Nonsubsampled Contourlet decomposition')
% Nonsubsampled Contourlet decomposition
dx = nsctdec( imx, nlevels, dfilter, pfilter );
dy = nsctdec( imy, nlevels, dfilter, pfilter );

% fusion
% 低频
lowx=dx{1};lowy=dy{1};
d{1}=selb(lowx,lowy,lf);

% % % % % % % % % % % % % % 
  
highx=dx{2};highy=dy{2};
fusion_high=selc(highx,highy,hf);
d{2}=fusion_high;
% % % % % % % 
% % % % % % % 
highx3=dx{1,3};highy3=dy{1,3};

highx=highx3(1);highy=highy3(1);
high_x=highx{1};high_y=highy{1};
fusion_high1=selc(high_x,high_y,hf);


highx=highx3(2);highy=highy3(2);
high_x=highx{1};high_y=highy{1};
fusion_high2=selc(high_x,high_y,hf);

d{3}={fusion_high1,fusion_high2};

% % % % % % % % 
highx4=dx{4};highy4=dy{4};
% % % % % % % % % % % 
highx=highx4(1);highy=highy4(1);
high_x=highx{1};high_y=highy{1};
fusion_high1=selc(high_x,high_y,hf);


highx=highx4(2);highy=highy4(2);
high_x=highx{1};high_y=highy{1};
fusion_high2=selc(high_x,high_y,hf);

highx=highx4(3);highy=highy4(3);
high_x=highx{1};high_y=highy{1};
fusion_high3=selc(high_x,high_y,hf);

highx=highx4(4);highy=highy4(4);
high_x=highx{1};high_y=highy{1};
fusion_high4=selc(high_x,high_y,hf);

highx=highx4(5);highy=highy4(5);
high_x=highx{1};high_y=highy{1};
fusion_high5=selc(high_x,high_y,hf);


highx=highx4(6);highy=highy4(6);
high_x=highx{1};high_y=highy{1};
fusion_high6=selc(high_x,high_y,hf);

highx=highx4(7);highy=highy4(7);
high_x=highx{1};high_y=highy{1};
fusion_high7=selc(high_x,high_y,hf);

highx=highx4(8);highy=highy4(8);
high_x=highx{1};high_y=highy{1};
fusion_high8=selc(high_x,high_y,hf);
% % % % % % % % % % % % % % % % % % % % % % % % % 
d{3}={fusion_high1,fusion_high2,fusion_high3,fusion_high4,fusion_high5,fusion_high6,fusion_high7,fusion_high8};
% % % % % % 




% Reconstruct image
Y = nsctrec( d, dfilter, pfilter ) ;

end
% % % % % % % % % % % % % % % % 




