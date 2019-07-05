clc;
clear;
close all;

%{
[filename, pathname] = uigetfile({'pic0.jpg' }, 'C:\ѧϰ\ҽѧ����\Project\pic0.jpg');
%û��ͼ��
if filename == 0
    return;
  end
img1 = imread([pathname, filename]);
[m, n, z] = size(img1);
figure(1)
imshow(img1)
h=imrect;%�����ʮ�֣�����ѡȡ����Ȥ����
%ͼ�оͻ���ֿ����϶��Լ��ı��С�ľ��ο�ѡ��λ�ú�
pos=getPosition(h);
%pos���ĸ�ֵ���ֱ��Ǿ��ο�����½ǵ������ x y �� ��� ��Ⱥ͸߶�
%����ѡȡͼƬ
imCp = imcrop( img1, pos );
figure(2)
imshow(imCp);
%}

%{
img1_cut=imcrop(img1);
figure(2);
subplot(121),imshow(img1_cut);
title('�ü�ͼ');
%imwrite(img1_cut,'cut.jpg')
%�ü�����ֿ�
info=imfinfo('C:\ѧϰ\ҽѧ����\Project\cut.jpg');
 W=info.Width;
 H=info.Height;
 n=30; 
max_row = floor(W/n);  
max_col = H;
seg = cell(max_row,max_col);  
%�ֿ�  
for row = 1:max_row         
    for col = 1:max_col          
    seg(row,col)= {Im((row-1)*height+1:row*height,(col-1)*width+1:col*width,:)};    % �ֿ鹫ʽ���õ�һ��seg
    end  
end   
%}


img1=imread('E:\����\����\Project\pic0.jpg');
%figure(1),imshow(img1,'XData',[0,40],'YData',[0,60])
figure(1),imshow(img1);
title('ԭͼ');
axis on
iptsetpref imshowAxesVisible on
xlabel x
ylabel y

%{
%ȡ�������򶥵�
[x,y]=ginput(2);
m=x1-x0;
n=(y1-y0)/30;
for i=1:30
  sample_x=[x0,x0+m];
  sample_y=[y0,y0+n];
  seg=cell(sample_x,sample_y); %�������ֳ�30��С��
  y0=y0+n;
end
%}
h=imrect;
pos=getPosition(h);
img1_cut = imcrop( img1, pos );
pos;  %pos���ĸ�ֵ���ֱ��Ǿ��ο�����½ǵ������ x y �� ��� ��Ⱥ͸߶�
figure(2)
imshow(img1_cut);

hold on
L = size(img1_cut);
height=6;
width=6;
max_row = floor(L(1)/height); %�ֳɼ���
max_col = floor(L(2)/width);  %�ֳɼ���
fprintf('ƽ���ֳ�%d��%d��\n',max_row,max_col);
seg = cell(max_row,max_col,max_row);
%�ֿ�
for row = 1:max_row      
    for col = 1:max_col        
    seg(row,col)= {img1_cut((row-1)*height+1:row*height,(col-1)*width+1:col*width,:)};  
    end
end 
for i=1:max_row
imwrite(seg{max_row,1 },strcat('m',int2str(i),'.jpg'));  %�����һ��
end

for i=1:max_row
  img_seg={max_row};   
  img_seg{i}=imread(['E:\����\����\Project\m',num2str(i),'.jpg']);
  mag=img_seg{i};
  [height_seg,width_seg,d]=size(mag);
  A=mag(1:height_seg,1:width_seg);
  %r(i)=corr2(img{i}(1:6,1:6),img12(1:6,1:6));
img2=imread('E:\����\����\Project\pic0.jpg');
[height_img2,width_img2,d]=size(img2);
%m=height_img2;
%n=width_img2;
p=1;  %p��߽�
p=1;  %p�ϱ߽�
q=1;
  for m=1:656
    n=1;
    for p=1:875
        B=img2(p:p+5,q:q+5); 
         r=corrcoef(A,B);
         R(m,n)=r(1,2); 
        n=n+1;
    end
    p=p+1
  end
end
% [i1,j1]=find(R==max(max(R)))
[max_R,max_j]=max(R,[],2);
y=40/1000/1000*(max_j-1);
hengzuobiao1=0.0768*((1:781)-1)+30;
plot(hengzuobiao1+0.63,y)
 axis([50 70 0 0.002])
hold on
% for i=1:370
%     L(i)=0;
% end
j=1;
 for i=0.03:0.0000768:0.09%60/1000/781%0.0000745
 if(i>0.0555&&i<0.0645)
 L(j)=80/1000/50*(1-(abs(i-60/1000)/(9/2/1000)).^2);
 else
     L(j)=0;
 end
 j=j+1;
 end
 hengzuobiao2=0.0768*((1:782)-1)+30;
plot(hengzuobiao2,L)  
legend({'ʵ�ʼ���ٶ�����','�����ٶ�����'})
