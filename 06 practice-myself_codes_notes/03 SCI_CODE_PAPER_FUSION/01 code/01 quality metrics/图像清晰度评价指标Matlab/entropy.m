function entropy

[name,path]=uigetfile({'*.*','请选择融合图像F'},'请打开融合图像F');
file=strcat(path,name);
F=imread(file);
if size(F,3)==3
    F=rgb2gray(F);
end
p=imhist(F);
p(p==0)=[];
p=p/numel(F);
EN=-sum(p.*log2(p))