load nelec;
indx=1:1024;
x=nelec(indx);
% 得到Haar小波的提升方案
lshaar=liftwave('haar');
% 将提升步骤ELS添加到提升方案中
els={'p',[-0.125 0.125],0};
lsnew=addlift(lshaar,els);
% 进行单层提升小波分解
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
% 获得信号压缩的阈值
[thr,nkeep]=wdcbm(c,l,alpha);
% 对信号进行压缩
[xd,cxd,lxd,perf0,perfl2]=wdencmp('lvd',c,l,'haar',1,thr,'s');
subplot(211);plot(indx,x);
title('原始信号');
subplot(212),plot(indx,xd);
title('压缩后的信号');
