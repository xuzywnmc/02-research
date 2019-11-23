clc;clear;
% main_quality(1,3,'NSST+PAPCNN');
% main_quality(2,3,'JSR-AR');
% main_quality(2,3,'CNN');
% DWT+Entropy
%%
%用于评价指标统一计算
Path = '.\image\MRI-PET';                   % 设置数据存放的文件夹路径
File = dir(fullfile(Path,'*.jpg'));  % 显示文件夹下所有符合后缀名为.txt文件的完整信息
FileNames = {File.name}';            % 提取符合后缀名为.txt的所有文件的文件名，转换为n行1列
for i=1:length(FileNames)
    first=FileNames(i);
    temp=cell2mat(first);
    method=temp(1:end-5);
    main_quality(i,3,method);
end
load main_quality.mat
%%
% [img1,img2,result]=read_image(3,'NSST+PAPCNN');
% [psnr, mse] = psnr_mse(img2, result)
% ifc=ifcvec(img1,result)
% overall_mssim = msssim(img2,result)
% [mssim1, ssim_map1] = ssim(img1, result);
% [mssim2, ssim_map2] = ssim(img2, result);
% a=(mssim1+mssim2)/2;
% vif=vifvec(img1,result)
% en=entropy(result);
% en1=entropy1(result);
% outval = avg_gradient(result) ;
% img=double(result(:,:,3));
% [M,N]=size(img);
% gradval=zeros(M,N); %save the gradient value of single pixel
% diffX=zeros(M,N);   %save the differential value of X orient
% diffY=zeros(M,N);   %save the differential value of Y orient
% tempX=zeros(M,N);
% tempY=zeros(M,N);
% tempX(1:M,1:(N-1))=img(1:M,2:N);
% tempY(1:(M-1),1:N)=img(2:M,1:N);
% diffX=tempX-img;
% diffY=tempY-img;
% diffX(1:M,N)=0;     %the boundery set to 0
% diffY(M,1:N)=0;
% diffX=diffX.*diffX;
% diffY=diffY.*diffY;
% AVEGRAD=sum(sum(diffX+diffY));
% AVEGRAD=sqrt(AVEGRAD/2);
% AVEGRAD=AVEGRAD/((M-1)*(N-1));