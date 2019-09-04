% 使用Haar小波，得到相应的提升方案
lshaar=liftwave('haar');
% 添加ELS到提升方案
els={'p',[-0.125 0.125],0};
lsnew=addlift(lshaar,els);
% 对于简单信号，尺度为1进行LWT
x=1:8;
[cA,cD]=lwt(x,lsnew);
% 对上面的信号，进行整数LWT
lshaarInt=liftwave('haar','int2int');
lsnewInt=addlift(lshaarInt,els);
[cAint,cDint]=lwt(x,lsnewInt);
% 进行逆变换
xRec=ilwt(cA,cD,lsnew);
err=max(max(abs(x-xRec)))
xRecInt=ilwt(cAint,cDint,lsnewInt);
errInt=max(max(abs(x-xRecInt)))
