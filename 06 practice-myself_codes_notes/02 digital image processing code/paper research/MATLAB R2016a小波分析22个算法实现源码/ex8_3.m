clear all;
clc;
load leleccum;
indx=1:1024;
x=leleccum(indx);
% ���������ź�
init=2055615866;
randn('seed',init);
nx=x+18*randn(size(x));
% �õ�HaarС������������
lshaar=liftwave('haar');
% ����������ELS��ӵ�����������
els={'p',[-0.125 0.125],0};
lsnew=addlift(lshaar,els);
% ��������С���ֽ�
[cA1,cD1]=lwt(x,lsnew);
[cA2,cD2]=lwt(cA1,lsnew);
length=size(cA2,2);
c=zeros(1,length*4);
for i=1:length;
    c(i)=cA2(i);
end
for i=length+1:2*length;
    c(i)=cD2(i-length);
end;
for i=length*2+1:4*length;
    c(i)=cD1(i-2*length);
end;
l(1)=length;
l(2)=length;
l(3)=length*2;
l(4)=length*4;
% ���Ƴ߶�1��������׼��
sigma=wnoisest(c,l,1);
alpha=2;
% �����������е���ֵ
thr=wbmpen(c,l,sigma,alpha);
keepapp=1;
% ���źŽ�������
xd=wdencmp('gbl',c,l,'db6',1,thr,'s',keepapp);
subplot(221);
plot(x);
title('ԭʼ�ź�');
subplot(222);
plot(nx);
title('�����ź�');
subplot(223);
plot(xd(1:1000));
title('�������ź�');
