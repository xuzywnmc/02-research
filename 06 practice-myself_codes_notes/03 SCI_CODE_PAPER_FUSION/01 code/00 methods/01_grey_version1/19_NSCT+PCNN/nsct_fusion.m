
% % % % 
function [y]= nsct_fusion(input1, input2 )

x1=input1
x2=input2

lf=4;hf=2;


img=fuse_nsct(x1,x2,lf,hf);
% img(:,:,2)=fuse_nsct(x1(:,:,2),x2(:,:,2),lf,hf);
% img(:,:,3)=fuse_nsct(x1(:,:,3),x2(:,:,3),lf,hf);
% [SSIM,RMSE,MI,PSNR,SF] =quality(x1,x2,img);
% [GI,P,C,QE]=measures(x1, x2,img);
% G = [GI(:,:,1)+GI(:,:,2)+GI(:,:,3)]/3;
% fprintf('\n\n   I分量的QPabc为:  :%.4f\n'  ,QPabc);
% fprintf('\n\n   I分量的Q为:  :%.4f\n'  ,Q);
% fprintf('\n\n   I分量的QW为:  :%.4f\n'  ,QW);
% fprintf('\n\n   I分量的QE为:  :%.4f\n'  ,QE);

y = img;
    

    
