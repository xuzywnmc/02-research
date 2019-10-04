% 获得Haar小波的提升方案
lshaar=liftwave('haar');
% 将提升步骤ELS加入到提升方案中
els={'p',[-0.125 0.125],0};
lsnew=addlift(lshaar,els);
% 实施二维提升小波分解
load woman;
nbc=size(map,1);
colormap(pink(nbc));
subplot(221);
image(wcodemat(X,nbc));
title('X');
[cA,cH,cV,cD]=lwt2(X,lsnew);
% 对同一个图像实施整数提升小波变换
lshaarInt=liftwave('haar','int2int');
lsnewInt=addlift(lshaarInt,els);
[cAint,cHint,cVint,cDint]=lwt2(X,lsnewInt);
% 实施提升小波逆变换
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
