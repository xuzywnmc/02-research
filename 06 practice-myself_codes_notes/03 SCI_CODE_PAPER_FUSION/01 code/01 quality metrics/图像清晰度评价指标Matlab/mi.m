function mi

[name,path]=uigetfile({'*.*','请选择原图像A'},'请打开原图像A');
file1=strcat(path,name);
[name,path]=uigetfile({'*.*','请选择融合图像F'},'请打开融合图像F');
file2=strcat(path,name);
a=imread(file2);
b=imread(file1);
a=rgb2gray(a);
b=rgb2gray(b);
a=double(a);
b=double(b);
[M,N]=size(a);
hab=zeros(256,256);
if max(max(a))~=min(min(a))
    a=(a-min(min(a)))/(max(max(a))-min(min(a)));
else
    a=zeros(M,N);
end
if max(max(b))~=min(min(b))
    b=(b-min(min(b)))/(max(max(b))-min(min(b)));
else
    b=zeros(M,N);
end
a=double(int16(a*255))+1; 
b=double(int16(b*255))+1;

for i=1:M
    for j=1:N
        index_x=a(i,j);
        index_y=b(i,j);
        hab(index_x,index_y)=hab(index_x,index_y)+1;
    end
end

habsum=sum(sum(hab));
index=find(hab~=0);
pab=hab/habsum;
Hab=sum(sum(-pab(index).*log2(pab(index))));

pa=sum(pab');
index=find(pa~=0);
Ha=sum(sum(-pa(index).*log2(pa(index))));

pb=sum(pab);
index=find(pb~=0);
Hb=sum(sum(-pb(index).*log2(pb(index))));

mi=Ha+Hb-Hab;


a=imread(file2);
[name,path]=uigetfile({'*.*','请选择原图像B'},'请打开原图像B');
file3=strcat(path,name);
b=imread(file3);
a=rgb2gray(a);
b=rgb2gray(b);
a=double(a);
b=double(b);
[M,N]=size(a);
hab=zeros(256,256);
if max(max(a))~=min(min(a))
    a=(a-min(min(a)))/(max(max(a))-min(min(a)));
else
    a=zeros(M,N);
end
if max(max(b))~=min(min(b))
    b=(b-min(min(b)))/(max(max(b))-min(min(b)));
else
    b=zeros(M,N);
end
a=double(int16(a*255))+1; 
b=double(int16(b*255))+1;

for i=1:M
    for j=1:N
        index_x=a(i,j);
        index_y=b(i,j);
        hab(index_x,index_y)=hab(index_x,index_y)+1;
    end
end

habsum=sum(sum(hab));
index=find(hab~=0);
pab=hab/habsum;
Hab=sum(sum(-pab(index).*log2(pab(index))));

pa=sum(pab');
index=find(pa~=0);
Ha=sum(sum(-pa(index).*log2(pa(index))));

pb=sum(pab);
index=find(pb~=0);
Hb=sum(sum(-pb(index).*log2(pb(index))));

MI=Ha+Hb-Hab+mi

