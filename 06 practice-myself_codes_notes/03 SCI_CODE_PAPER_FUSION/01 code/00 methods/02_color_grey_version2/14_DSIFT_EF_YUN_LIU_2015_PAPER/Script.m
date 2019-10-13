clear all;close all;clc;

%static fusion
% I=load_images('images\CGC\gg',1); 
path='C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\00 methods\02_color_grey_version2\SOUCEIMAGES\oral'
  path1=strcat(path,'\MP\'),  
   I=load_images(path1,1); 
[B ,A ,result]=oral(2,'DSIFT_EF')
F=DSIFT_fusion(I,16,2,1);
figure,imshow(F);
   imwrite(F,result)
% %dynamic fusion
% I=load_images('images\ForrestSequence\',1);
% F=DSIFT_fusion(I,16,1,2);
% figure,imshow(F);
% 
% %flash and no-flash
% I=load_images('images\flash\',1);
% F=DSIFT_fusion(I,16,2,1);
% figure,imshow(F);
% 















