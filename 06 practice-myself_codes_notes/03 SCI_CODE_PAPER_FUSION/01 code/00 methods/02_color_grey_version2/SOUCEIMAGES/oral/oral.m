function [img1,img2,result]=oral(choose,method)
path='C:\E-DATA-GROUNP\github\02-research\06 practice-myself_codes_notes\03 SCI_CODE_PAPER_FUSION\01 code\00 methods\02_color_grey_version2\SOUCEIMAGES\oral'
     if choose ==1
                path1=strcat(path,'\MC\CT-009.jpg'),
                path2=strcat(path,'\MC\MRI-009.jpg'),
                result=strcat(path,'\result\',method,'1.jpg');
        else if choose ==2
                path1=strcat(path,'\MP\PET-009.jpg'),
                path2=strcat(path,'\MP\MRI-009.jpg'),
                result=strcat(path,'\result\',method,'2.jpg');
        else if choose==3
                path1=strcat(path,'\MS\SPECT-009.jpg'),
                path2=strcat(path,'\MS\MRI-009.jpg'),
                result=strcat(path,'\result\',method,'3.jpg');
            end
        end
     end
     img1 =double(imread(path1));
    img2=double(imread(path2));