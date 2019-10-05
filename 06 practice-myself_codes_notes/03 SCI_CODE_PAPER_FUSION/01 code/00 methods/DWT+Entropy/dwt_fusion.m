function [y SSIM]= dwt_fusion(x1, x2 )

% x1=imresize(input1,[256,256]);
% x2=imresize(input2,[256,256]);

lf=5;hf=3;
zt =3;
img=fuse_dwb(x1,x2,zt,lf,hf);
% img(:,:,1)=fuse_dwb(x1(:,:,1),x2(:,:,1),zt,lf,hf);
% img(:,:,2)=fuse_dwb(x1(:,:,2),x2(:,:,2),zt,lf,hf);
% img(:,:,3)=fuse_dwb(x1(:,:,3),x2(:,:,3),zt,lf,hf);
[SSIM,RMSE,MI,PSNR,SF] =quality(x1,x2,img);
% [GI,P,C,QE]=measures(x1, x2,img);
% G = [GI(:,:,1)+GI(:,:,2)+GI(:,:,3)]/3;
% fprintf('\n\n   I分量的QPabc为:  :%.4f\n'  ,QPabc);
% fprintf('\n\n   I分量的Q为:  :%.4f\n'  ,Q);
% fprintf('\n\n   I分量的QW为:  :%.4f\n'  ,QW);
% fprintf('\n\n   I分量的QE为:  :%.4f\n'  ,QE);

y = img;
    
