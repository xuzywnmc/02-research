clc,clear
%%%% gray image fusion
% I = load_images( '.\sourceimages\grayset',1); 
% F = GFF(I);
% imshow(F);
%%%% color image fusion
path='C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\00 methods\02_color_grey_version2\SOUCEIMAGES\oral'
path1=strcat(path,'\MC\MRI-009.jpg');
path2=strcat(path,'\MC\SPECT-009.jpg');
path3=strcat(path,'\MC\');
method='GF',
result=strcat(path,'\result\',method,'1.jpg');
% img1=imread(path1);
% img2=imread(path2);
% img2=imresize(img2,[256,256]);
% imwrite(uint8(img2),path2);
I = load_images( path3,1); 
F = GFF(I);
imwrite(uint8(F),result);
% figure,imshow(F);