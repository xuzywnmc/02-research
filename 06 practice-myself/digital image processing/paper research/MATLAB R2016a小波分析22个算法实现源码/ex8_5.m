% �õ�HaarС������������
lshaar=liftwave('haar');
% ���ELS������������
els={'p',[-0.125 0.125],0};
lsnew=addlift(lshaar,els);
% 2������С���ֽ�
load noisdopp;
x=noisdopp;
xDec=lwt(x,lsnew,2);
% ��ȡ��1��Ľ���ϵ��
ca1=lwtcoef('ca',xDec,lsnew,2,1);
% ��ȡ��2��Ľ���ϵ��
ca2=lwtcoef('ca',xDec,lsnew,2,2);
% ��ȡ��1���ϸ��ϵ��
cd1=lwtcoef('cd',xDec,lsnew,2,1);
% ��ȡ��2���ϸ��ϵ��
cd2=lwtcoef('cd',xDec,lsnew,2,2);
subplot(311);
plot(x);
title('ԭʼ�ź�');
subplot(323);
plot(ca1);
title('��һ������ź�');
subplot(324);
plot(ca2);
title('�ڶ�������ź�');
subplot(325);
plot(cd1);
title('��һ��ϸ���ź�');
subplot(326);
plot(cd2);
title('�ڶ���ϸ���ź�');
