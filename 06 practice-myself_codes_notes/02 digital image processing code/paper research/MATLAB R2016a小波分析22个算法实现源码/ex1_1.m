% ʹ��HaarС�����õ���Ӧ����������
lshaar=liftwave('haar');
% ���ELS����������
els={'p',[-0.125 0.125],0}
lsnew=addlift(lshaar,els);
% ���ڼ�ͼ�񣬳߶�Ϊ2����LWT
x=reshape(1:16,4,4);
xDec=lwt2(x,lsnew,2)
% ��ȡ��һ��ĵ�Ƶϵ��
ca1=lwtcoef2('ca',xDec,lsnew,2,1)
% �ع���Ƶ�͸�Ƶ
a1=lwtcoef2('a',xDec,lsnew,2,1)
a2=lwtcoef2('a',xDec,lsnew,2,2)
h1=lwtcoef2('h',xDec,lsnew,2,1)
v1=lwtcoef2('v',xDec,lsnew,2,1)
d1=lwtcoef2('d',xDec,lsnew,2,1)
h2=lwtcoef2('h',xDec,lsnew,2,2)
v2=lwtcoef2('v',xDec,lsnew,2,2)
d2=lwtcoef2('d',xDec,lsnew,2,2)
% ����ع�Ч��
err=max(max(abs(x-a2-h2-v2-d2-h1-v1-d1)))
