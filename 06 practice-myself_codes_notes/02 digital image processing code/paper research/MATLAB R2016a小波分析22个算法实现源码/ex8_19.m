clear;
clc;
% �õ�HaarС������������
lshaar=liftwave('haar');
% ���ELS������������
els={'p',[-0.125 0.125],0};
lsnew=addlift(lshaar,els);
% 2������С���ֽ�
load woman;
xDec=lwt2(X,lsnew,2);
% ��ȡ����ͼ���ϸ��ͼ��
a2=lwtcoef2('a',xDec,lsnew,2,2);
h1=lwtcoef2('h',xDec,lsnew,2,1);
v1=lwtcoef2('v',xDec,lsnew,2,1);
d1=lwtcoef2('d',xDec,lsnew,2,1);
h2=lwtcoef2('h',xDec,lsnew,2,2);
v2=lwtcoef2('v',xDec,lsnew,2,2);
d2=lwtcoef2('d',xDec,lsnew,2,2);
% ����ع����
err=max(max(abs(X-a2-h2-v2-d2-h1-v1-d1)))
nbc=size(map,1);
colormap(pink(nbc));
subplot(121);
image(wcodemat(X,nbc));
title('ԭʼͼ��');
subplot(122);
image(wcodemat(a2,nbc));
title('�ع��ڶ������ͼ��');
figure;
subplot(231);
image(wcodemat(h1,nbc));
title('��һ��ˮƽ����ͼ��');
subplot(232);
image(wcodemat(v1,nbc));
title('��һ�㴹ֱ����ͼ��');
subplot(233);
image(wcodemat(d1,nbc));
title('��һ��ԽǷ���ͼ��');
subplot(234);
image(wcodemat(h2,nbc));
title('�ڶ���ˮƽ����ͼ��');
subplot(235);
image(wcodemat(v2,nbc));
title('�ڶ��㴹ֱ����ͼ��');
subplot(236);
image(wcodemat(d2,nbc));
title('�ڶ���ԽǷ���ͼ��');
