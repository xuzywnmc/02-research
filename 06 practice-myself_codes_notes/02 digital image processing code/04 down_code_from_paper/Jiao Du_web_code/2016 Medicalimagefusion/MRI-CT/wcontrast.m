function Fcon=wcontrast(pic)
%二维向量一维化
graypic=rgb2gray(pic);
x=graypic(:);
%四阶矩
M4=mean((x-mean(x)).^4);
%方差
delta2=var(x,1);
%峰度
alfa4=M4./(delta2^2);
%标准差
delta=std(x,1);
%对比度
Fcon=delta./(alfa4.^(1/4));
end