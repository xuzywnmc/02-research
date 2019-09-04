% ���HaarС������������
lshaar=liftwave('haar');
% ����������ELS���뵽����������
els={'p',[-0.125 0.125],0};
lsnew=addlift(lshaar,els);
% ʵʩ��ά����С���ֽ�
load woman;
nbc=size(map,1);
colormap(pink(nbc));
subplot(221);
image(wcodemat(X,nbc));
title('X');
[cA,cH,cV,cD]=lwt2(X,lsnew);
% ��ͬһ��ͼ��ʵʩ��������С���任
lshaarInt=liftwave('haar','int2int');
lsnewInt=addlift(lshaarInt,els);
[cAint,cHint,cVint,cDint]=lwt2(X,lsnewInt);
% ʵʩ����С����任
xRec=ilwt2(cA,cH,cV,cD,lsnew);
err=max(max(abs(X-xRec)))
subplot(222);
image(wcodemat(xRec,nbc));
title('xRec');
xRecInt=ilwt2(cAint,cHint,cVint,cDint,lsnewInt);
errInt=max(max(abs(X-xRecInt)))
subplot(223);
image(wcodemat(xRecInt,nbc));
title('xRecInt');
