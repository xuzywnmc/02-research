clc;
load woman;
nbc=size(map,1);
% �õ�HaarС������������
lshaar=liftwave('haar');
% ����������ELS��ӵ�����������
els={'p',[-0.125 0.125],0};
lsnew=addlift(lshaar,els);
load woman;
% ����һ������С���ֽ�
[cA,cH,cV,cD]=lwt2(X,lsnew);
length=size(cA,1);
c=zeros(1,length*length*4);
for i=1:length;
    c((i-1)*length+1:i*length)=cA(:,i);
end;
for i=length+1:2*length;
    c((i-1)*length+1:i*length)=cH(:,i-length);
end;
for i=2*length+1:3*length;
    c((i-1)*length+1:i*length)=cV(:,i-2*length);
end;
for i=3*length+1:4*length;
    c((i-1)*length+1:i*length)=cD(:,i-3*length);
end;
s=zeros(3,2);
s(:,1)=[length,length,2*length];
s(:,2)=[length,length,2*length];
% ʹ��wdcbm2���ѹ����ֵ
alpha=1.5;m=3.5*prod(s(1,:));
[thr,nkeep]=wdcbm2(c,s,alpha,m);
% ��ͼ�����ѹ��
xd=wdencmp('lvd',c,s,'haar',1,thr,'h');
colormap(pink(nbc));
figure(1);
subplot(121);
image(wcodemat(X,nbc));
title('ԭʼͼ��');
subplot(122);
image(wcodemat(xd,nbc));
title('ѹ�����ͼ��');
