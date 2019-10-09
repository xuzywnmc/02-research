function cross_entropy

[name,path]=uigetfile({'*.*','请选择原图像A'},'请打开原图像A');
file1=strcat(path,name);
[name,path]=uigetfile({'*.*','请选择原图像B'},'请打开原图像B');
file2=strcat(path,name);
[name,path]=uigetfile({'*.*','请选择融合图像F'},'请打开融合图像F');
file3=strcat(path,name);
g1=imread(file1);
g2=imread(file2);
g3=imread(file3);
if size(g1,3)==3
    g1=rgb2gray(g1);
end
if size(g2,3)==3
    g2=rgb2gray(g2);
end
if size(g3,3)==3
    g3=rgb2gray(g3);
end

p1=imhist(g1);
p1(p1==0)=[1];
p1=p1/numel(g1);
p2=imhist(g2);
p2(p2==0)=[1];
p2=p2/numel(g2);
p3=imhist(g3);
p3(p3==0)=[1];
p3=p3/numel(g3);
CE1=abs(sum(p1.*log2(p1./p3)));
CE2=abs(sum(p2.*log2(p2./p3)));
MCE=(CE1+CE2)/2
RCE=sqrt((CE1^2+CE2^2)/2)
