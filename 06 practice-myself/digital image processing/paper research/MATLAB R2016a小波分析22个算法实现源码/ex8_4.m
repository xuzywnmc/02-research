% �õ�HaarС������������
lshaar=liftwave('haar');
% ���ELS������������
els={'p',[-0.125 0.125],0};
lsnew=addlift(lshaar,els);
% ���е�������С���ֽ�
load noisdopp;
x=noisdopp;
[cA,cD]=lwt(x,lsnew);
figure(1);
subplot(311);
plot(x);
title('ԭʼ�ź�');
subplot(312);
plot(cA);
title('����С���ֽ�ĵ�Ƶ�ź�');
subplot(313);
plot(cD);
title('����С���ֽ�ĸ�Ƶ�ź�');
% ֱ��ʹ��HaarС������2������С���ֽ�
[cA,cD]=lwt(x,'haar',2);
figure(2);
subplot(311);
plot(x);
title('ԭʼ�ź�');
subplot(312);
plot(cA);
title('2������С���ֽ�ĵ�Ƶ�ź�');
subplot(313);
plot(cD);
title('2������С���ֽ�ĸ�Ƶ�ź�');
