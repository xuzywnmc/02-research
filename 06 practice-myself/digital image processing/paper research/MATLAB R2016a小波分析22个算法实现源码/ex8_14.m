load woman;
% ��������ͼ��
init=2055615886;
randn('seed',init);
x=X+18*randn(size(X));
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
% ʹ��wdcbm2���ȥ����ֵ
alpha=3;m=3.5*prod(s(1,:));
[thr,nkeep]=wdcbm2(c,s,alpha,m);
% ��ͼ�����ȥ��
sorh='s';
xd=wdencmp('lvd',c,s,'haar',1,thr,sorh);
colormap(pink(nbc));
figure(1);
subplot(221);
image(wcodemat(X,nbc));
title('ԭʼͼ��');
subplot(222);
image(wcodemat(x,nbc));
title('����ͼ��');
subplot(223);
image(wcodemat(xd,nbc));
title('ȥ����ͼ��');
