% ���HaarС������������
lshaar=liftwave('haar');
% ����������ELS���뵽����������
els={'p',[-0.125 0.125],0};
lsnew=addlift(lshaar,els);
% ���е�������С���ֽ�
load noisdopp;
x=noisdopp;
subplot(211);
plot(x);
ylabel('x');
% ʵʩ����С���任
[cA,cD]=lwt(x,lsnew);
xRec=ilwt(cA,cD,lsnew);
err=max(max(abs(x-xRec)))
subplot(212);
plot(xRec);
ylabel('xRec');
