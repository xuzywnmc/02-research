%װ�ز���ʾԭʼͼ��
load wbarb 
subplot(2,2,1);
image(X);
colormap(map);
title('ԭʼͼ�� ');
axis square;
disp('ѹ��ǰͼ��Ĵ�С��');
whos('X')

%��ͼ�����7��С���ֽ�
[c,l]=wavedec2(X,2,'bior3.7');
%��ȡС���ֽ�ṹ�е�һ��ĵ�Ƶϵ���͸�Ƶϵ��
cA1=appcoef2(c,l,'bior3.7',1);
%ˮƽ����
cH1=detcoef2('h',c,l,1);
%б�߷���
cD1=detcoef2('d',c,l,1);
%��ֱ����
cV1=detcoef2('v',c,l,1);

%�ع���һ��ϵ��
A1=wrcoef2('a',c,l,'bior3.7',1);
H1=wrcoef2('h',c,l,'bior3.7',1);
D1=wrcoef2('d',c,l,'bior3.7',1);
V1=wrcoef2('v',c,l,'bior3.7',1);
c1=[A1 H1;V1 D1];

%��ʾ��һ��Ƶ����Ϣ
subplot(2,2,2);
image(c1);
title('�ֽ��ĵ�Ƶ�͸�Ƶ��Ϣ');

%��ͼ�����ѹ����������һ���Ƶ��Ϣ�����������������
ca1=wcodemat(cA1,440,'mat',0);
%�ı�ͼ��߶Ȳ���ʾ
ca1=0.1*ca1;
subplot(2,2,3);
image(ca1);
colormap(map);
title('��һ��ѹ����ͼ��');
axis square;
disp('��һ��ѹ����ͼ��Ĵ�С��');
whos('ca1')
%ѹ��ͼ�񣺱����ڶ����Ƶ��Ϣ�����������������
cA2=appcoef2(c,l,'bior3.7',2);
ca2=wcodemat(cA2,440,'mat',0);
ca2=0.1*ca2;
subplot(2,2,4);
image(ca2);
colormap(map);
title('�ڶ���ѹ����ͼ��');
disp('�ڶ���ѹ����ͼ���С��');
whos('ca2')
