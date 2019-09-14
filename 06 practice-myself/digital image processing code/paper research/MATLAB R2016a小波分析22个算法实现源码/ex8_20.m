% ʹ��HaarС�����õ���Ӧ����������
lshaar=liftwave('haar');
% ���ELS����������
els={'p',[-0.125 0.125],0};
lsnew=addlift(lshaar,els);
% ���ڼ�ͼ�񣬳߶�Ϊ1����LWT
x=reshape(1:16,4,4);
[cA,cH,cV,cD]=lwt2(x,lsnew);
% �������ͼ�񣬽�������LWT
lshaarInt=liftwave('haar','int2int');
lsnewInt=addlift(lshaarInt,els);
[cAint,cHint,cVint,cDint]=lwt2(x,lsnewInt);
% ������任
xRec=ilwt2(cA,cH,cV,cD,lsnew);
err=max(max(abs(x-xRec)))
xRecInt=ilwt2(cAint,cHint,cVint,cDint,lsnewInt);
errInt=max(max(abs(x-xRecInt)))
