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
ca2=lwtcoef2('ca',xDec,lsnew,2,2);
ch1=lwtcoef2('ch',xDec,lsnew,2,1);
cv1=lwtcoef2('cv',xDec,lsnew,2,1);
cd1=lwtcoef2('cd',xDec,lsnew,2,1);
ch2=lwtcoef2('ch',xDec,lsnew,2,2);
cv2=lwtcoef2('cv',xDec,lsnew,2,2);
cd2=lwtcoef2('cd',xDec,lsnew,2,2);
nbc=size(map,1);
colormap(pink(nbc));
subplot(121);
image(wcodemat(X,nbc));
title('ԭʼͼ��');
subplot(122);
image(wcodemat(ca2,nbc));
title('�ڶ������ͼ��');
figure;
subplot(231);
image(wcodemat(ch1,nbc));
title('��һ��ˮƽ����ͼ��');
subplot(232);
image(wcodemat(cv1,nbc));
title('��һ�㴹ֱ����ͼ��');
subplot(233);
image(wcodemat(cd1,nbc));
title('��һ��ԽǷ���ͼ��');
subplot(234);
image(wcodemat(ch2,nbc));
title('�ڶ���ˮƽ����ͼ��');
subplot(235);
image(wcodemat(cv2,nbc));
title('�ڶ��㴹ֱ����ͼ��');
subplot(236);
image(wcodemat(cd2,nbc));
title('�ڶ���ԽǷ���ͼ��');
