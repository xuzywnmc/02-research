% �õ�HaarС������������
lshaar=liftwave('haar');
% ���ELS������������
els={'p',[-0.125 0.125],0};
lsnew=addlift(lshaar,els);
load woman;
% ����һ������С���ֽ�
[cA,cH,cV,cD]=lwt2(X,lsnew);
figure(1);
nbc=size(map,1);
colormap(pink(nbc));
subplot(321);
image(wcodemat(X,nbc));
title('ԭʼͼ��');
subplot(322);
image(wcodemat(cA,nbc));
title('����С���ֽ�ĵ�Ƶͼ��');
subplot(323);
image(wcodemat(cH,nbc));
title('ˮƽ�����Ƶͼ��');
subplot(324);
image(wcodemat(cV,nbc));
title('��ֱ�����Ƶͼ��');
subplot(325);
image(wcodemat(cD,nbc));
title('�ԽǷ����Ƶͼ��');
