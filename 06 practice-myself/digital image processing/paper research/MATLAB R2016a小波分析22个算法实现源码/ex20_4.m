% װ��ͼ��X����װ���ͼ��
load tire;
figure(1);
subplot(221);
image(X);
colormap(map);
title('ԭʼͼ��');
axis square;
% ��Ĭ�ϵ�shannon�أ��ֽ�ͼ��
t=wpdec2(X,2,'db1');
plot(t);% ���Ĳ����ṹͼ
% �Էֽ�ṹ[t,d]�����ع�
rectire=wprec2(t);
% �����ع����ͼ��
figure(1);
subplot(222);
image(rectire);
colormap(map);
title('�ع����ͼ��');
axis square;
