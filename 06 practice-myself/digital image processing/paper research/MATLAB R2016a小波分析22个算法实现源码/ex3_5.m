load wbarb;
subplot(1,2,1);

image(X);
colormap(map);
title('ԭʼͼ��');

%����Ĭ�ϵ�ȫ����ֵ
[thr,sorh,keepapp,crit]=ddencmp('cmp','wp',X);
%ͼ�����ѹ��
Xc=wpdencmp(X,sorh,3,'bior3.1',crit,thr,keepapp);

%��ʾѹ�����
subplot(1,2,2);
image(Xc);
colormap(map);
title('ȫ����ֵѹ��ͼ��');
