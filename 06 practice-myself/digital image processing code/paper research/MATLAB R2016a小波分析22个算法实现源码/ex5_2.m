%װ���ź�
load nelec;  
indx=1:1024;
x=nelec(indx);
% ��С��haar���źŽ������ֽ�
[c,l]=wavedec(x,5,'haar');  
% ��ȡ�ź�ѹ������ֵ
[thr,nkeep]=ddencmp('cmp','wv',x);
% ���źŽ���ѹ��
xd=wdencmp('gbl',c,l,'haar',5,thr,'s',1);  
subplot(2,1,1);  
plot(indx,x);  
title('ԭʼ�ź�');  
subplot(2,1,2);  
plot(indx,xd);  
title('ѹ������ź�');
