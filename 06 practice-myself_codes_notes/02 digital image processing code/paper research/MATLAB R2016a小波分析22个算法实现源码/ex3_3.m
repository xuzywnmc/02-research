%װ�ز���ʾԭʼͼ��
load trees;
subplot(2,2,1);
image(X);
colormap(map);
title('ԭʼͼ��');
axis square;

%���ɺ���ͼ��
init=2055615866;
randn('seed',init);
X1=X+20*randn(size(X));
subplot(2,2,2);
image(X1);
colormap(map);
title('����ͼ��');
axis square; 

%��С��sym2��ͼ��X1����һ��С�����ֽ�
T=wpdec2(X1,1,'sym2');

%������ֵ
thr=8.342;

%��ͼ���С�����ֽ�ϵ����������ֵ����
NT=wpthcoef(T,0,'s',thr);

%���Ե�Ƶϵ�������ع�
X2=wprcoef(NT,1);

%����������ͼ��
subplot(2,2,3);
image(X2);
colormap(map);
title('������ͼ��');
axis square;
