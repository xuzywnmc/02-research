load facets
subplot(2,2,1);
image(X);
colormap(map);
title('ԭʼͼ��');

%���ɺ���ͼ��ͼʾ
init=2055615866;
randn('seed',init);
XX=X+8*randn(size(X));
subplot(2,2,2);
image(XX);
colormap(map);
title('����ͼ��');

%��ͼ��������봦��
%��С������coif2��ͼ��XX����2��ֽ�
[c,l]=wavedec2(XX,2,'coif2');
%���ó߶�����
n=[1,2];
%������ֵ����
p=[10.28,24.08];

%�Ը�ƵС��ϵ��������ֵ����
%nc=wthcoef2(��h��,c,l,n,p,��s��);
%nc=wthcoef2(��v��,c,l,n,p,��s��);
nc=wthcoef2('d',c,l,n,p,'s');
%ͼ��Ķ�άС���ع�
X1=waverec2(nc,l,'coif2');
subplot(2,2,3);
image(X1);
colormap(map);
title('��һ��������ͼ��');

%�ٴζԸ�ƵС��ϵ��������ֵ����
%mc=wthcoef2(��h��,nc,l,n,p,��s��);
mc=wthcoef2('v',nc,l,n,p,'s');
%mc=wthcoef2(��d��,nc,l,n,p,��s��);

%%ͼ��Ķ�άС���ع�
X2=waverec2(mc,l,'coif2');
subplot(2,2,4);
image(X2);
colormap(map);
title('�ڶ���������ͼ��');
