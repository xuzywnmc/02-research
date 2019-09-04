clc;
load woman;
nbc=size(map,1);
% 得到Haar小波的提升方案
lshaar=liftwave('haar');
% 将提升步骤ELS添加到提升方案中
els={'p',[-0.125 0.125],0};
lsnew=addlift(lshaar,els);
load woman;
% 进行一层提升小波分解
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
% 使用wdcbm2获得压缩阈值
alpha=1.5;m=3.5*prod(s(1,:));
[thr,nkeep]=wdcbm2(c,s,alpha,m);
% 对图像进行压缩
xd=wdencmp('lvd',c,s,'haar',1,thr,'h');
colormap(pink(nbc));
figure(1);
subplot(121);
image(wcodemat(X,nbc));
title('原始图像');
subplot(122);
image(wcodemat(xd,nbc));
title('压缩后的图像');
