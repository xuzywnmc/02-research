els={'p',[-0.125 0.125],0};
lsnew=addlift(lshaar,els);
% 2������С���ֽ�
load noisdopp;
x=noisdopp;
xDec=lwt(x,lsnew,2);
% �ع������źź�ϸ���ź�
a1=lwtcoef('a',xDec,lsnew,2,1);
a2=lwtcoef('a',xDec,lsnew,2,2);
d1=lwtcoef('d',xDec,lsnew,2,1);
d2=lwtcoef('d',xDec,lsnew,2,2);
% ����ع����
err=max(abs(x-a2-d2-d1))
subplot(311);
plot(x);
title('ԭʼ�ź�');
subplot(323);
plot(a1);
title('�ع���һ������ź�');
subplot(324);
plot(a2);
title('�ع��ڶ�������ź�');
subplot(325);
plot(d1);
title('�ع���һ��ϸ���ź�');
subplot(326);
plot(d2);
title('�ع��ڶ���ϸ���ź�');
