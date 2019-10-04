% 使用Haar小波，得到相应的提升方案
lshaar=liftwave('haar');
% 添加ELS到提升方案
els={'p',[-0.125 0.125],0};
lsnew=addlift(lshaar,els);
% 对于简单图像，尺度为1进行LWT
x=reshape(1:16,4,4);
[cA,cH,cV,cD]=lwt2(x,lsnew);
% 对上面的图像，进行整数LWT
lshaarInt=liftwave('haar','int2int');
lsnewInt=addlift(lshaarInt,els);
[cAint,cHint,cVint,cDint]=lwt2(x,lsnewInt);
% 进行逆变换
xRec=ilwt2(cA,cH,cV,cD,lsnew);
err=max(max(abs(x-xRec)))
xRecInt=ilwt2(cAint,cHint,cVint,cDint,lsnewInt);
errInt=max(max(abs(x-xRecInt)))
