%װ��һ����ά�ź�
load tire;
%��ʾͼ��
subplot(221);image(X);colormap(map)
title('ԭʼͼ��','fontsize',8);
axis square
%�������ͼ��ѹ��
%��ͼ����db3С������2��С���ֽ�
[c,s]=wavedec2(X,2,'db3');
%ʹ��wavedec2������ʵ��ͼ���ѹ��
[thr,sorh,keepapp]=ddencmp('cmp','wv',X);
%���������ѡ����ȫ����ֵѡ�gbl�������������и�Ƶϵ��������ͬ����ֵ��������
[Xcomp,cxc,lxc,perf0,perfl2]=wdencmp('gbl',c,s,'db3',2,thr,sorh,keepapp);
%��ѹ�����ͼ����ԭʼͼ����Ƚϣ�����ʾ����
subplot(222);image(Xcomp);colormap(map)
title('ѹ��ͼ��','fontsize',8);
axis square
disp('С���ֽ�ϵ������0��ϵ�������ٷֱȣ�');
perf0
disp('ѹ����ͼ��ʣ�������ٷֱȣ�');
perfl2
