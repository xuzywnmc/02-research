%��������Ⱥ��������ֵ
snr=4;
init=2055615866;
%����ԭʼ�ź�sref�ͱ���˹��������Ⱦ���ź�s
[sref,s]=wnoise(1,11,snr,init);

%��sym8С�����ź�s����3��ֽⲢ��ϸ��ϵ��
%ѡ��sure��ֵģʽ�ͳ߶�����
xd=wden(s,'heursure','s','one',3,'sym8');

%��ʾ�źŲ���
subplot(3,1,1);
plot(sref);
xlabel('������� n');
ylabel('��ֵ A');
title('�ο��ź�');
subplot(3,1,2);
plot(s);
title('�����ź�');
xlabel('������� n');
ylabel('��ֵ A');
subplot(3,1,3);
plot(xd);
title('�����ź�');
xlabel('������� n');
ylabel('��ֵ A');
