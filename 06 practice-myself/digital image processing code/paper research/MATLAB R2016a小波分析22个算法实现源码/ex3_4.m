%װ��Դ�ź�
load noisbump;
s=noisbump(1:1000);
figure(1);
subplot(2,1,1);
plot(s);
xlabel('������� n');
ylabel('��ֵ A');
title('ԭʼ�ź�');
%����Ĭ����ֵ����С��������wpdencmp��s����ѹ������
[thr,sorh,keepapp,crit]=ddencmp('cmp','wp',s);
[sc,treed,perf0,perfl2]= wpdencmp(s,sorh,3,'db2',crit,thr,keepapp);
subplot(2,1,2);
plot(sc);
xlabel('������� n');
ylabel('��ֵ A');
title('ѹ������ź�');
