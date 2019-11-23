function [img1,img2,result]=read_image(choose,method)
path='.\image\'
     if choose ==1
                path1=strcat(path,'MC\CT-009.jpg'),
                path2=strcat(path,'MC\MRI-009.jpg'),
                result=strcat(path,'\result\',method,'1.jpg');
        else if choose ==2
                path1=strcat(path,'MP\PET-009.jpg'),
                path2=strcat(path,'MP\MRI-009.jpg'),
                result=strcat(path,'result\',method,'2.jpg');
        else if choose==3
                path1=strcat(path,'PET-0093.jpg'),
                path2=strcat(path,'MRI-0092.jpg'),
                result=strcat(path,'MRI-PET\',method,'2.jpg');
            end
        end
     end
     img1 =double(imread(path1));
    img2=double(imread(path2));
    result=double(imread(result));