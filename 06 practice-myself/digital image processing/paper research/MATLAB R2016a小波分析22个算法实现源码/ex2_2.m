%����װ��ԭʼͼ��X�к��б�װ�ص�ͼ��
load wmandril;
%����ԭʼͼ��
subplot(221);image(X);colormap(map);
title('ԭʼͼ��');
axis square
%��������ͼ��
init=2055615866;randn('seed',init)
x=X+38*randn(size(X));
%��������ͼ��
subplot(222);image(x);colormap(map);
title('������ͼ��');
axis square;
%�������ͼ���ȥ�봦��
%��С������sym4��x����2��С���ֽ�
[c,s]=wavedec2(x,2,'sym4');
%��ȡС���ֽ��е�һ��ĵ�Ƶͼ�񣬼�ʵ���˵�ͨ�˲�ȥ��
a1=wrcoef2('a',c,s,'sym4');
%����ȥ����ͼ��
subplot(223);image(a1);
title('��һ��ȥ��ͼ��');
axis square;
%��ȡС���ֽ��еڶ���ĵ�Ƶͼ�񣬼�ʵ���˵�ͨ�˲�ȥ��
%�൱�ڰѵ�һ��ĵ�Ƶͼ�񾭹���һ�εĵ�Ƶ�˲�����
a2=wrcoef2('a',c,s,'sym4',2);
%����ȥ����ͼ��
subplot(224);image(a2);title('�ڶ���ȥ��ͼ��');
axis square;
