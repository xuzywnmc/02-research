% ʹ��HaarС�����õ���Ӧ����������
lshaar=liftwave('haar');
% ���ELS����������
els={'p',[-0.125 0.125],0}
lsnew=addlift(lshaar,els);
% ���ڼ��źţ�����2��LWT
x=1:8;
xDec=lwt(x,lsnew,2)
% ��ȡ�߶�Ϊ1ʱ�ĵ�Ƶϵ��
ca1=lwtcoef('ca',xDec,lsnew,2,1)
% �ع���Ƶ�͸�Ƶ
a1=lwtcoef('a',xDec,lsnew,2,1)
a2=lwtcoef('a',xDec,lsnew,2,2)
d1=lwtcoef('d',xDec,lsnew,2,1)
d2=lwtcoef('d',xDec,lsnew,2,2)
% ����ع�Ч��
err=max(abs(x-a2-d2-d1))
