%װ�ز���ʾԭʼͼ��
load vcosig;
%���뺬��
init=2055615866;
randn('seed',init);
X1=X+20*randn(size(X));
figure(1);
image(X1);
colormap(map);
title('ԭʼͼ��');
axis square;
%��С��db4��ͼ��X����һ��С�����ֽ�
T=wpdec2(X1,1,'db4');
%�ع�ͼ����Ʋ���
figure(2);
A=wprcoef(T,[1 0]);
image(A);
title('ͼ��Ľ��Ʋ���');
axis square;
%��Ե���
figure(3);
%%ԭͼ��ı�Ե���
BW1 = edge(X1,'prewitt');
imshow(BW1);
title('ԭͼ��ı�Ե');
axis square;
%%ͼ����Ʋ��ֵı�Ե���
figure(4);
BW2= edge(A,'prewitt');
imshow(BW2);
title('ͼ����Ʋ��ֵı�Ե');
axis square;
