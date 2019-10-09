function psnr
[name,path]=uigetfile({'*.*','请选择原图像'},'请打开原图像');
file1=strcat(path,name);
[name,path]=uigetfile({'*.*','请选择融合图像F'},'请打开融合图像F');
file2=strcat(path,name);
A=imread(file1);
F=imread(file2);
if size(A,3)==3
    A=rgb2gray(A);
end
if size(F,3)==3
    F=rgb2gray(F);
end
[height width]=size(A);
A = im2double(A);
F = im2double(F);

sigma1=0;
for i=1:height
    for j=1:width
        sigma1=sigma1+(A(i,j)-F(i,j))^2;
    end
end

MSE=(sigma1/(height*width));  %均方误差
PSNR=10*log10((255^2)/MSE)