% �õ�HaarС������������
lshaar=liftwave('haar');
% ����������ELS��ӵ�����������
els={'p',[-0.125 0.125],0};
lsnew=addlift(lshaar,els);
% 2������С���ֽ�
load noisdopp;
x=noisdopp;
subplot(211);
plot(x);
ylabel('x');
% ���ź�ʵʩ��������С���任
lshaarInt=liftwave('haar','int2int');
lsnewInt=addlift(lshaarInt,els);
[cAint,cDint]=lwt(x,lsnewInt);
% ʵʩ����С���任
xRecInt=ilwt(cAint,cDint,lsnewInt);
errInt=max(max(abs(x-xRecInt)))
subplot(212);
plot(xRecInt);
ylabel('xRecInt');
