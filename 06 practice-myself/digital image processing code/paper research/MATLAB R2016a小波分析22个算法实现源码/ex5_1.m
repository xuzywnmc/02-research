%װ���ź�
load nelec;  
indx=1:1024;
x=nelec(indx);
% ��С��haar���źŽ�������ֽ�
[c,l]=wavedec(x,3,'haar');  
alpha=1.5;
% ��ȡ�ź�ѹ������ֵ
[thr,nkeep]=wdcbm(c,l,alpha);
% ���źŽ���ѹ��
[xd,cxd,lxd,perf0,perfl2]=wdencmp('lvd',c,l,'haar',3,thr,'s');  
subplot(2,1,1);  
plot(indx,x);  
title('ԭʼ�ź�');  
subplot(2,1,2);  
plot(indx,xd);  
title('ѹ������ź�');
