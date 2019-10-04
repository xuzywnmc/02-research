function thresholdtestdemo(imgname,wavename,level,deta) 
% thresholdtestdemo 小波变换在不同阈值下重构的测试演示程序 
% thresholdtestdemo(imgname,wavename,level,deta) 
%  本程序作用:载入图像信号,使用小波变换,比较显示不同阈值下的重构图像及相关信息 
%  输入: imgname ----要装载的图像名称 
%  wavename ----变换小波名称 
%  level ----小波分解级数 
%  deta ----测试阈值增加值 
%  缺省时:变换图像为color256.png, 3级haar小波变换 deta=5 

if nargin==0 
imgname='color256.png'; 
wavename='haar'; 
level=1; 
deta=90; 
else 
if nargin==1 
wavename='haar'; 
level=3; 
deta=5; 
else 
if nargin==2 
level=3; 
deta=5; 
else 
if nargin==3 
deta=5; 
end 
end 
end 
end 

%  读入的X中含有被装载的图像信号,map中含有被装载的color 
[X,map] = imread(imgname); 

% 检测图像格式 
% 输入矩阵X为3维时为真彩色图像,RGB三个分量需分别分解与重构 
% 输入图像为索引图像时(map不为空),转换为RGB真彩色图像,再作分解与重构,因为索引图每个像素的颜色值 
% 不是矩阵的数值,真正应该显示的颜色为读入的矩阵X上的值通过颜色表map变换得到的,如果直接用来作变
% 换,即有可能会发生失真情况 

if isempty(map) 
emp=1; 
else 
X=ind2rgb(X,map)*255; 
emp=0; 
end 
if ndims(X)==3 
imgcolor=1; 
Xr=X(:,:,1); 
Xg=X(:,:,2); 
Xb=X(:,:,3); 
else 
imgcolor=0; 
end 

info=imfinfo(imgname); 
ss=round((info(1).FileSize)/1024); 
sname=size(imgname); 
orgname=imgname(1:sname(2)-4); 
nfile=struct('name',''); 
X=double(X); 
% 画出原始图像 
figure(1); 
subplot(2,3,1); 
imshow(uint8(X));colormap(map); 
title(strcat(wavename,'小波变换阈值测试(',mat2str(level),'级)')); 
xlabel(strcat('原始图像(Size: ',mat2str(ss),'KB)')); 
axis square 
% 小波分解 
if imgcolor 
[Cr,Sr]=wavedec2(Xr,level,wavename); 
[Cg,Sg]=wavedec2(Xg,level,wavename); 
[Cb,Sb]=wavedec2(Xb,level,wavename); 
C(1,:)=Cr; 
C(2,:)=Cg; 
C(3,:)=Cb; 
else 
[C,S]=wavedec2(X,level,wavename); 
end 

% 在不同阈值下测试 
T(1)=0; 
for i=1:4 
% 用0置换矩阵中绝对值小于阈值的数值 
if T(i)>0 
C(find(abs(C)<=T(i)))=0; 
%C=wthresh(C,'h',T(i)); 
end 

% 计算零的个数 
zeronum(i)=prod(size(find(C==0))); 

% 重构不同阈值下图像 
if imgcolor 
Cr=C(1,:); 
Cg=C(2,:); 
Cb=C(3,:); 
Ar=waverec2(Cr,Sr,wavename); 
Ag=waverec2(Cg,Sg,wavename); 
Ab=waverec2(Cb,Sb,wavename); 
A(:,:,1)=uint8(round(Ar)); 
A(:,:,2)=uint8(round(Ag)); 
A(:,:,3)=uint8(round(Ab)); 
else 
A=waverec2(C,S,wavename); 
A=uint8(round(A)); 
end 

% 存贮新图像,图像名为原图像名+小波名+阈值大小 
nfile(i).name=strcat(orgname,'_',wavename,'_',mat2str(T(i)),'.png'); 
imwrite(A,nfile(i).name,'png'); 

% 获取图像大小信息 
info=imfinfo(nfile(i).name); 
if info(1).FileSize>1024 
sfile(i)=round((info(1).FileSize)/1024); 
sunit='KB'; 
else 
sfile(i)=info(1).FileSize; 
sunit='B'; 
end 

% 画出重构图像 
figure(1); 
subplot(2,3,i+1); 
imshow(uint8(A)); 
title(strcat('阈值T=',int2str(T(i)),' (Size:',int2str(sfile(i)),sunit,')')); 
xlabel(strcat('系数含"0"数目=',int2str(zeronum(i)))); 
axis square 
if i<3 
T(i+1)=T(i)+deta; 
else 
if i==3 
T(i+1)=T(i)+2*deta; 
end 
end; 
end 

% 画出不同阈值对应的文件大小及系数为零的关系图 
if and(or(min(zeronum)>1000,zeronum(1)==0),zeronum(4)/1000>sfile(4)) 
zeronum=zeronum/1000; 
overth=1; 
else 
overth=0; 
end; 
subplot(2,3,6); 
plot(T,zeronum,'-rs','LineWidth',1,... 
'MarkerEdgeColor','k',... 
'MarkerFaceColor','g',... 
'MarkerSize',5); 
hold on; 
plot(T,sfile,'-bs','LineWidth',1,... 
'MarkerEdgeColor','k',... 
'MarkerFaceColor','y',... 
'MarkerSize',5); 
xlabel(' 阈值T '); 
axis([0 100 min(sfile(1),zeronum(1)) max(sfile(4),zeronum(4))]); 

meant=(zeronum(4)-sfile(4))/8; 
if overth 
text(10,zeronum(4)+meant,'系数含"0"数目/1000'); 
else 
text(10,zeronum(4)+meant,'系数含"0"数目'); 
end 
text(15,sfile(4)+meant,strcat('文件大小(',sunit,')')); 
axis square 
