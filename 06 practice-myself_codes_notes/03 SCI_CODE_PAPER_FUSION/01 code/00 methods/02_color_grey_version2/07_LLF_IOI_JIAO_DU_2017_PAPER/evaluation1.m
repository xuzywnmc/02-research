
function [SF, EI, MI, TMQIQ] = evaluation1(img1, img2, F)
%%
  % % % % % % % % % % % % % % % % % % %  
 HSI1 = rgb2hsi (img1);
 HSI2 = rgb2hsi (img2);
 HSIf = rgb2hsi (F);
 I1=HSI1(:,:,3);I2=HSI2(:,:,3); If=HSIf(:,:,3);  
% % % % % % % % % % %  
% % % % 
SF=space_frequency(If);
EI=edge_intensity(If);
%%
MIA=mutinf(I1, If);
MIB=mutinf(I2, If);
MI = 2*(MIA+MIB);
% % % % 
 window = ones(8);
Q1 = TMQI(img1, F, window);
Q2 = TMQI(img2, F, window);
TMQIQ = (Q1 + Q2)*0.5;
end
