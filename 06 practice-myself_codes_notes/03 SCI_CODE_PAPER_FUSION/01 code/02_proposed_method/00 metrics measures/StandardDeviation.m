
%计算标准差
%======================================================================
%标准差，反映了灰度相对于灰度均值的离散程度。标准差越大，则灰度级分布越分散。
%======================================================================

% clear all; clc
% [filename,pathname]=uigetfile('*.jpg','图像');
% A=imread([pathname,filename]);
function SD=StandardDeviation(A)
A=double(A);
Average=mean2(A(:));
[M,N]=size(A);
sum=0;

for i=1:M
    for j=1:N
        sum=sum+(A(i,j)-Average)^2;
    end
end

SD=sqrt(sum/(M*N));
end