function psnr
[name,path]=uigetfile({'*.*','��ѡ��ԭͼ��'},'���ԭͼ��');
file1=strcat(path,name);
[name,path]=uigetfile({'*.*','��ѡ���ں�ͼ��F'},'����ں�ͼ��F');
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

MSE=(sigma1/(height*width));  %�������
PSNR=10*log10((255^2)/MSE)