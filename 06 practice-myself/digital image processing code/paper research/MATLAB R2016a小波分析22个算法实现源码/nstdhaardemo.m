function nstdhaardemo(imgname) 
% nstdhaardemo haar小波三级非标准规格化分解与重构演示程序 
% nstdhaardemo(imgname) 
% 本程序作用:载入图像文件,显示图像3级非标准haar小波规格化分解与重构过程 
% 输入: imgname ----要装载的图像名称(真彩色,灰度图,索引图) 
% 缺省图像为color256.png 

if nargin==0 
imgname='color256.png'; 
end 
% 读入的X中含有被装载的图像信号,map中含有被装载的color 
[X,map] = imread(imgname); 
if ndims(X)==3 
imgcolor=1; 
else 
imgcolor=0; 
end 
X=double(X); 
h=size(X,1); 

%画出原始图像 
figure(1); 
subplot(4,4,1);imshow(uint8(X),map); 
title(' haar小波3级非标准规格化分解过程'); 
xlabel('原始图像'); 
axis square 

position=2; 
A=X; 
%依次序画出3级非标准规格化分解过程中对应的行变换,列变换图像 
for i=1:3 
A011=decompose(A,imgcolor,1,1,h); 
subplot(4,4,position);imshow(uint8(A011),map);axis square 
A012=decompose(A011,imgcolor,1,2,h); 
subplot(4,4,position+4);imshow(uint8(A012),map);axis square 
xlabel(strcat(int2str(i),'级分解图像')); 
A=A012; 
h=h/2; 
position=position+5; 
end 
xlabel('haar小波3级非标准规格化分解图象'); 

%画出3级分解图像 
figure(2); 
subplot(4,4,1);imshow(uint8(A),map); 
title('haar小波3级非标准规格化分解重构过程'); 
xlabel('3级分解图像'); 
axis square 
position=2; 

%依次序画出3级非标准规格化分解后重构过程中对应的行变换,列变换图像 
if imgcolor 
h=size(A(:,:,1),1)/4; 
else 
h=size(A,1)/4; 
end 
for i=1:3 
RX11=reconstruct(A,imgcolor,1,1,h); 
subplot(4,4,position);imshow(uint8(RX11),map);axis square 
RX12=reconstruct(RX11,imgcolor,1,2,h); 
subplot(4,4,position+4);imshow(uint8(RX12),map);axis square 
xlabel(strcat(int2str(3-i),'级重构图像')); 
A=RX12; 
h=h*2; 
position=position+5; 
end 
xlabel('haar小波3级非标准分解后重构图像'); 
figure(1); 
