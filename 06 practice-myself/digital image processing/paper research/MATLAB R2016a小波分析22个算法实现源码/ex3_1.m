%װ��ԭʼ�źŲ�ͼʾ֮
load noismima;
s=noismima(1:1000);
figure(1);
subplot(2,2,1);
plot(s);
xlabel('������� n');
ylabel('��ֵ A');
title('ԭʼ�ź�');

%����Ĭ����ֵ����wdencmp�����������봦��
[thr,sorh,keepapp,crit]=ddencmp('den','wp',s);

%��ȫ����ֵѡ��������봦��
[c,treed,perf0,perfl2]= wpdencmp(s,sorh,3,'db2',crit,thr,keepapp);
subplot(2,2,3);
plot(c);
xlabel('������� n');
ylabel('��ֵ A');
title('Ĭ����ֵ�����ź�');

%����ǰ�������Ч����������ֵ��С��������
thr=thr+15;
[c1,treed,perf0,perfl2]= wpdencmp(s,sorh,3,'db2',crit,thr,keepapp);
subplot(2,2,4);
plot(c1);
xlabel('������� n');
ylabel('��ֵ A');
title('������ֵ��������ź�');
