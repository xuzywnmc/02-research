% 
 % [M, Sminima, Smaxima, Eminima, Emaxima, D] = localExtrema(I, k) 
 % 
 % Local Extrema filter 
 % 
 % I: the input image data 
 % Y: the reference/cross/joint data, default to luminance(I) 
 % k: the width of neighborhood for idenfication of local minima/maxima 
 %    default to 3 
 % 
 % M: smoothed image (base) 
 % Sminima: local minima extrema 
 % Smaxima: local maxima extrema 
 % Eminima: extermal envelope of minima extrema 
 % Emaxima: extremal envelopes of maxima extrema 
 % 
 % author: Shuen-Huei (Drake) Guan 
 % 
 % % % % 

% % % % % % % % % % % % % 
function [y,SSIM,RMSE,MI,PSNR,SF, G, P, C QE]= les_fusion(input1, input2 )
x1=imresize(input1,[256,256]);
x2=imresize(input2,[256,256]);
% % % % % % % % % % % % % 
I = x1;
[D11, C11] = localExtrema(I,3);
[D12, C12] = localExtrema(I,5);
[D13, C13] = localExtrema(I,7);
% % detailed and corase image at different scale3,5,7 

% % % % % % % % % % % % % 
I = x2;
[D21, C21] = localExtrema(I,3);
[D22, C22] = localExtrema(I,5);
[D23, C23] = localExtrema(I,7);

% % detailed and corase image at different scale3,5,7 
% % % % % % fused coarse images

CM= (C11+C21 + C21+C22 + C13+C23)/6;
w11 = D11./CM;
w12 = D12./CM;
w13 = D13./CM;
w21 = D21./CM;
w22= D22./CM;
w23 = D23./CM;
% % % % % % % 
if w11 > w21
    D1 = D11;
elseif w11 == w21
    D1 = 0.5*(D11+D21);
else
    D1 = D21;
end
% % % % % % % % % % 

% % % % % % % 
if w12 > w22
    D2 = D21;
elseif w12 == w22
    D2 = 0.5*(D21+D22);
else
    D2 = D22;
end
% % % % % % % % % % 

% % % % % % % 
if w13 > w23
    D3 = D13;
elseif w13 == w23
    D3 = 0.5*(D13+D23);
else
    D3 = D23;
end
% % % % % % % % % % 
DM = (D1 +D2 +D3)/3;
F = CM + DM;
% % % % % % % % % % 
[SSIM,RMSE,MI,PSNR,SF] =quality(x1,x2,F);
[GI,P,C,QE]=measures(x1, x2, F);
G = [GI(:,:,1)+GI(:,:,2)+GI(:,:,3)]/3;
y = F;
end








 
