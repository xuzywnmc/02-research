%����װ��ԭʼͼ��X�к��б�װ�ص�ͼ��
load facets;
%����ԭʼͼ��
subplot(221);image(X);colormap(map);
title('ԭʼͼ��');
axis square
%����������ͼ��
init=2055615866;randn('seed',init)
x=X+10*randn(size(X));
%����������ͼ��
subplot(222);image(X);colormap(map);
title('������ͼ��');
axis square
%�������ͼ���ȥ�봦��
%��С������coif3��x����2��С���ֽ�
[c,s]=wavedec2(x,2,'coif3');
%��ȡС���ֽ��е�һ��ĵ�Ƶͼ�񣬼�ʵ���˵�ͨ�˲�ȥ��
%���ó߶�����n
n=[1,2]
%������ֵ����p
p=[10.12,23.28];
%�����������Ƶϵ��������ֵ����
nc=wthcoef2('h',c,s,n,p,'s');
nc=wthcoef2('v',c,s,n,p,'s');
nc=wthcoef2('d',c,s,n,p,'s');
%���µ�С���ֽ�ṹ[nc��s]�����ع�
xx=waverec2(nc,s,'coif3');
%�����ع���ͼ��Ĳ���
subplot(223);image(X);colormap(map);
title('ȥ����ͼ��');
axis square
