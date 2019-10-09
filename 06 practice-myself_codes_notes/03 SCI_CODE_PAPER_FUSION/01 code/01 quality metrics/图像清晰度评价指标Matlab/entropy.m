function entropy

[name,path]=uigetfile({'*.*','��ѡ���ں�ͼ��F'},'����ں�ͼ��F');
file=strcat(path,name);
F=imread(file);
if size(F,3)==3
    F=rgb2gray(F);
end
p=imhist(F);
p(p==0)=[];
p=p/numel(F);
EN=-sum(p.*log2(p))