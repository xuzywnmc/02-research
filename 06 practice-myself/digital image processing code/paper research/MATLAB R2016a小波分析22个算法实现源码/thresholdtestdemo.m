function thresholdtestdemo(imgname,wavename,level,deta) 
% thresholdtestdemo С���任�ڲ�ͬ��ֵ���ع��Ĳ�����ʾ���� 
% thresholdtestdemo(imgname,wavename,level,deta) 
%  ����������:����ͼ���ź�,ʹ��С���任,�Ƚ���ʾ��ͬ��ֵ�µ��ع�ͼ�������Ϣ 
%  ����: imgname ----Ҫװ�ص�ͼ������ 
%  wavename ----�任С������ 
%  level ----С���ֽ⼶�� 
%  deta ----������ֵ����ֵ 
%  ȱʡʱ:�任ͼ��Ϊcolor256.png, 3��haarС���任 deta=5 

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

%  �����X�к��б�װ�ص�ͼ���ź�,map�к��б�װ�ص�color 
[X,map] = imread(imgname); 

% ���ͼ���ʽ 
% �������XΪ3άʱΪ���ɫͼ��,RGB����������ֱ�ֽ����ع� 
% ����ͼ��Ϊ����ͼ��ʱ(map��Ϊ��),ת��ΪRGB���ɫͼ��,�����ֽ����ع�,��Ϊ����ͼÿ�����ص���ɫֵ 
% ���Ǿ������ֵ,����Ӧ����ʾ����ɫΪ����ľ���X�ϵ�ֵͨ����ɫ��map�任�õ���,���ֱ����������
% ��,���п��ܻᷢ��ʧ����� 

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
% ����ԭʼͼ�� 
figure(1); 
subplot(2,3,1); 
imshow(uint8(X));colormap(map); 
title(strcat(wavename,'С���任��ֵ����(',mat2str(level),'��)')); 
xlabel(strcat('ԭʼͼ��(Size: ',mat2str(ss),'KB)')); 
axis square 
% С���ֽ� 
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

% �ڲ�ͬ��ֵ�²��� 
T(1)=0; 
for i=1:4 
% ��0�û������о���ֵС����ֵ����ֵ 
if T(i)>0 
C(find(abs(C)<=T(i)))=0; 
%C=wthresh(C,'h',T(i)); 
end 

% ������ĸ��� 
zeronum(i)=prod(size(find(C==0))); 

% �ع���ͬ��ֵ��ͼ�� 
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

% ������ͼ��,ͼ����Ϊԭͼ����+С����+��ֵ��С 
nfile(i).name=strcat(orgname,'_',wavename,'_',mat2str(T(i)),'.png'); 
imwrite(A,nfile(i).name,'png'); 

% ��ȡͼ���С��Ϣ 
info=imfinfo(nfile(i).name); 
if info(1).FileSize>1024 
sfile(i)=round((info(1).FileSize)/1024); 
sunit='KB'; 
else 
sfile(i)=info(1).FileSize; 
sunit='B'; 
end 

% �����ع�ͼ�� 
figure(1); 
subplot(2,3,i+1); 
imshow(uint8(A)); 
title(strcat('��ֵT=',int2str(T(i)),' (Size:',int2str(sfile(i)),sunit,')')); 
xlabel(strcat('ϵ����"0"��Ŀ=',int2str(zeronum(i)))); 
axis square 
if i<3 
T(i+1)=T(i)+deta; 
else 
if i==3 
T(i+1)=T(i)+2*deta; 
end 
end; 
end 

% ������ͬ��ֵ��Ӧ���ļ���С��ϵ��Ϊ��Ĺ�ϵͼ 
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
xlabel(' ��ֵT '); 
axis([0 100 min(sfile(1),zeronum(1)) max(sfile(4),zeronum(4))]); 

meant=(zeronum(4)-sfile(4))/8; 
if overth 
text(10,zeronum(4)+meant,'ϵ����"0"��Ŀ/1000'); 
else 
text(10,zeronum(4)+meant,'ϵ����"0"��Ŀ'); 
end 
text(15,sfile(4)+meant,strcat('�ļ���С(',sunit,')')); 
axis square 
