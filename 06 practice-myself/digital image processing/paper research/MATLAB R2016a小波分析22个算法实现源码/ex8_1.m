load nelec;
indx=1:1024;
x=nelec(indx);
% �õ�HaarС������������
lshaar=liftwave('haar');
% ����������ELS��ӵ�����������
els={'p',[-0.125 0.125],0};
lsnew=addlift(lshaar,els);
% ���е�������С���ֽ�
[cA,cD]=lwt(x,lsnew);
length=size(cA,2);
c=zeros(1,length*2);
for i=1:length;
    c(i)=cA(i);
end
for i=length+1:2*length;
    c(i)=cD(i-length);
end;
l(1)=length;
l(2)=length;
l(3)=length*2;
alpha=1.5;
% ����ź�ѹ������ֵ
[thr,nkeep]=wdcbm(c,l,alpha);
% ���źŽ���ѹ��
[xd,cxd,lxd,perf0,perfl2]=wdencmp('lvd',c,l,'haar',1,thr,'s');
subplot(211);plot(indx,x);
title('ԭʼ�ź�');
subplot(212),plot(indx,xd);
title('ѹ������ź�');
