 MC 
path='C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\00 methods\02_color_grey_version2\SOUCEIMAGES\oral\'
img1 =double(imread(path+'MC\CT-009.jpg'));
 img2=double(imread(path+'MC\MIR-009.jpg'));

imwrite(uint8(y),path+'result\GF1.jpg')