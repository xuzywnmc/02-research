% 测试梅花型矩阵和重采样矩阵
I=imread('test.tif')
[M L] = size(I);
I(1,3)=77;
tt=max([M L]);
% % m=3*M
result=zeros();
figure(1);
imshow(I);
title('原图')
for i=1:M%先循环行M
   for j=1:L %在循环列
%        k1=i-j+512;
%        k2=i+j+512;
            disp('i');
            disp(i);
            disp('j');
            disp(j);
         result(i-j+tt,i+j+tt)=I(i,j);
         if result(i-j+tt,i+j+tt)==77
                tab1=i-j+tt;
                tabe=i+j+tt;
         end
   end
end
figure;
imshow(result);
% shape=[1 -1,1 1];
% temp=shape*I;
% p=randperm(row*column);
% %如果你需要采N个点存在sample里
% sample=I(p(1:N)); 