% folder = 'D:\杜娇博一下学期\neurocomputing期刊回信\数据集\MRI-CT-010-Fatal stroke';
tr='D:\杜娇博一下学期\neurocomputing期刊回信\实验数据集\MRI-CT-010-Fatal stroke';
tr1='\MRI-00';
tr11 ='\MRI-0';
tr111='.jpg';
tr2='\CT-00';
tr22= '\CT-0';
tr3='\F';
sum_SSIM = 0;
sum_RMSE = 0;
sum_MI = 0;
sum_PSNR = 0;
sum_SF = 0;
sum_G = 0;
sum_P = 0;
sum_C = 0;
sum_QE = 0;
% % % % % % % % % % % % % % % 
% for i=1 :9
%     dir1 = [tr,tr1,int2str(i),tr111];
%     dir2 = [tr,tr2,int2str(i),tr111];
%     img1 =double(imread(dir1));
%     img2= double(imread(dir2));
[img1 ,img2 ,result]=oral(3,'DWT+Entropy');
    [y,SSIM,RMSE,MI,PSNR,SF, G, P, C QE]= dwt_fusion(img1, img2);
     imwrite(uint8(y),result)
%     dir3=[tr,tr3,int2str(i)];
%     imwrite(uint8(y),strcat(dir3,'.jpg'));
%     sum_SSIM = SSIM + sum_SSIM;
%     sum_RMSE = RMSE + sum_RMSE;
%     sum_MI = MI + sum_MI;
%     sum_PSNR = PSNR +sum_PSNR;
%     sum_SF = SF + sum_SF;
%     sum_G = G + sum_G;
%     sum_P = P + sum_P;
%     sum_C = C + sum_C;
%     sum_QE = QE + sum_QE;
% end
% 
% for i=10 :23
%      dir1 = [tr,tr11,int2str(i),tr111];
%     dir2 = [tr,tr22,int2str(i),tr111];
%     img1 =double(imread(dir1));
%     img2= double(imread(dir2));
%     [y,SSIM,RMSE,MI,PSNR,SF, G, P, C QE]= dwt_fusion(img1, img2);
%     dir3=[tr,tr3,int2str(i)];
%     imwrite(uint8(y),strcat(dir3,'.jpg'));
%     sum_SSIM = SSIM + sum_SSIM;
%     sum_RMSE = RMSE + sum_RMSE;
%     sum_MI = MI + sum_MI;
%     sum_PSNR = PSNR +sum_PSNR;
%     sum_SF = SF + sum_SF;
%     sum_G = G + sum_G;
%     sum_P = P + sum_P;
%     sum_C = C + sum_C;
%     sum_QE = QE + sum_QE;
% end
% 
% fprintf('\n\n   I分量的sum_SSIM为:  :%.4f\n'  ,sum_SSIM/23);
% 
% fprintf('\n\n   I分量的sum_RMSE为:  :%.4f\n'  ,sum_RMSE/23);
% 
% fprintf('\n\n   I分量的sum_MI为:  :%.4f\n'  ,sum_MI/23);
% 
% fprintf('\n\n   I分量的sum_PSNR为:  :%.4f\n'  ,sum_PSNR/23);
% 
% fprintf('\n\n   I分量的sum_SF为:  :%.4f\n'  ,sum_SF/23);
% 
% fprintf('\n\n   I分量的sum_G为:  :%.4f\n'  ,sum_G/23);
% 
% fprintf('\n\n   I分量的sum_P为:  :%.4f\n'  ,sum_P/23);
% 
% fprintf('\n\n   I分量的sum_C为:  :%.4f\n'  ,sum_C/23);
% 
% fprintf('\n\n   I分量的sum_QE为:  :%.4f\n'  ,sum_QE/23);