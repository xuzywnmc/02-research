
%�����׼��
%======================================================================
%��׼���ӳ�˻Ҷ�����ڻҶȾ�ֵ����ɢ�̶ȡ���׼��Խ����Ҷȼ��ֲ�Խ��ɢ��
%======================================================================

% clear all; clc
% [filename,pathname]=uigetfile('*.jpg','ͼ��');
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