% ʹ��HaarС�����õ���Ӧ����������
lshaar=liftwave('haar');
% ���ELS����������
els={'p',[-0.125 0.125],0};
lsnew=addlift(lshaar,els);
% ���ڼ��źţ��߶�Ϊ1����LWT
x=1:8;
[cA,cD]=lwt(x,lsnew);
% ��������źţ���������LWT
lshaarInt=liftwave('haar','int2int');
lsnewInt=addlift(lshaarInt,els);
[cAint,cDint]=lwt(x,lsnewInt);
% ������任
xRec=ilwt(cA,cD,lsnew);
err=max(max(abs(x-xRec)))
xRecInt=ilwt(cAint,cDint,lsnewInt);
errInt=max(max(abs(x-xRecInt)))
